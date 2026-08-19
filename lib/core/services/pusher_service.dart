import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:medics/core/utils/app_constant.dart';

class PusherServices {
  int? currentActiveConversationId;
  PusherChannelsClient? _client;
  PrivateChannel? _globalUserChannel;
  PrivateChannel? _chatChannel;

  String? _cachedToken;

  StreamSubscription? _globalEventSubscription;
  StreamSubscription? _chatEventSubscription;
  StreamSubscription? _connectionSubscription;
  Completer<void>? _connectionReady;

  final StreamController<Map<String, dynamic>> _globalStreamController =
      StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get globalStream =>
      _globalStreamController.stream;

  final StreamController<Map<String, dynamic>> _chatStreamController =
      StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get chatStream => _chatStreamController.stream;

  Future<void> connectGlobal({
    required String token,
    required int userId,
  }) async {
    try {
      if (_client != null) {
        debugPrint("ℹ️ Pusher client is already initialized.");
        return;
      }

      _cachedToken = token;
      _connectionReady = Completer<void>();

      final hostOptions = PusherChannelsOptions.fromHost(
        scheme: 'ws',
        host: AppConstant.ipAddress,
        port: 8080,
        key: 'localkey',
        shouldSupplyMetadataQueries: true,
        metadata: PusherChannelsOptionsMetadata.byDefault(),
      );

      _client = PusherChannelsClient.websocket(
        options: hostOptions,
        connectionErrorHandler: (exception, trace, refresh) {
          debugPrint("🚨 Reverb WebSocket Error: $exception");
          refresh();
        },
      );

      _globalUserChannel = _client!.privateChannel(
        'private-App.Models.User.$userId',
        authorizationDelegate:
            EndpointAuthorizableChannelTokenAuthorizationDelegate.forPrivateChannel(
              authorizationEndpoint: Uri.parse(
                '${AppConstant.baseUrl}/broadcasting/auth',
              ),
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
              },
            ),
      );

      _globalEventSubscription = _globalUserChannel!
          .bind(
            'Illuminate\\Notifications\\Events\\BroadcastNotificationCreated',
          )
          .listen((event) {
            if (event.data != null) {
              try {
                final decodedData = jsonDecode(event.data.toString());
                _globalStreamController.add(
                  Map<String, dynamic>.from(decodedData),
                );
                debugPrint("🎧 Global Notification Stream Triggered");
              } catch (e) {
                debugPrint("🚨 Error parsing global event data: $e");
              }
            }
          });

      _connectionSubscription = _client!.onConnectionEstablished.listen((_) {
        debugPrint(
          "🚀 Global WebSocket Connected! Subscribing to Global User Channel...",
        );
        if (!(_connectionReady?.isCompleted ?? true)) {
          _connectionReady!.complete();
        }
        _globalUserChannel!.subscribe();
      });

      _client!.connect();
      debugPrint("🚀 Connection request sent to Laravel Reverb...");
    } catch (e) {
      debugPrint("🚨 Pusher Global Connect Error: $e");
    }
  }

  Future<void> subscribeToChat({required int conversationId}) async {
    if (_client == null || _cachedToken == null) {
      debugPrint(
        "🚨 Cannot subscribe to chat: Client or Token is null. Call connectGlobal first.",
      );
      return;
    }

    unsubscribeFromChat();

    debugPrint("🎧 Subscribing to chat channel: private-chat.$conversationId");

    _chatChannel = _client!.privateChannel(
      'private-chat.$conversationId',
      authorizationDelegate:
          EndpointAuthorizableChannelTokenAuthorizationDelegate.forPrivateChannel(
            authorizationEndpoint: Uri.parse(
              '${AppConstant.baseUrl}/broadcasting/auth',
            ),
            headers: {
              'Authorization': 'Bearer $_cachedToken',
              'Accept': 'application/json',
            },
          ),
    );

    _chatEventSubscription = _chatChannel!.bind('message.sent').listen((event) {
      if (event.data != null) {
        try {
          final decodedData = jsonDecode(event.data.toString());
          _chatStreamController.add(Map<String, dynamic>.from(decodedData));
          debugPrint("🎧 New message added to Chat Room Stream");
        } catch (e) {
          debugPrint("🚨 Error parsing chat event data: $e");
        }
      }
    });

    _chatChannel!.bind('pusher:subscription_error').listen((event) {
      debugPrint('🚨 Chat channel subscription error: ${event.data}');
    });

    try {
      await _connectionReady?.future.timeout(const Duration(seconds: 10));
    } catch (e) {
      debugPrint('🚨 Timed out waiting for Reverb connection: $e');
      return;
    }

    if (_chatChannel == null) return;
    _chatChannel!.subscribe();
  }

  void unsubscribeFromChat() {
    _chatEventSubscription?.cancel();
    _chatChannel?.unsubscribe();
    _chatEventSubscription = null;
    _chatChannel = null;
    debugPrint(
      "🧹 Unsubscribed from chat room successfully. Global channel is still live.",
    );
  }

  Future<void> disconnectAll() async {
    try {
      await _globalEventSubscription?.cancel();
      await _chatEventSubscription?.cancel();
      await _connectionSubscription?.cancel();

      _globalUserChannel?.unsubscribe();
      _chatChannel?.unsubscribe();
      _client?.disconnect();

      _globalEventSubscription = null;
      _chatEventSubscription = null;
      _connectionSubscription = null;
      _globalUserChannel = null;
      _chatChannel = null;
      _client = null;
      _cachedToken = null;
      _connectionReady = null;

      debugPrint(
        "🔒 Fully disconnected from Reverb server and cached token cleared.",
      );
    } catch (e) {
      debugPrint("🚨 Pusher Disconnect All Error: $e");
    }
  }
}
