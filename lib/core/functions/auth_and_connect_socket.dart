import 'package:flutter/material.dart';
import 'package:medics/core/database/cache/cache_helper.dart';
import 'package:medics/core/functions/user_functions.dart';
import 'package:medics/core/services/local_notification_service.dart';
import 'package:medics/core/services/pusher_service.dart';
import 'package:medics/core/services/service_locator.dart';

void checkAuthAndConnectSocket() async {
  debugPrint("🔌 Checking authentication and connecting to Pusher...");
  final token = getIt<CacheHelper>().getData(key: 'token');
  debugPrint("🔑 Retrieved token: $token");
  final userIdString = UserFunctions.getUser()?.id.toString();
  debugPrint("🆔 Retrieved userId: $userIdString");

  if (token != null && userIdString != null) {
    await getIt<PusherServices>().connectGlobal(
      token: token,
      userId: int.parse(userIdString.toString()),
    );

    getIt<PusherServices>().globalStream.listen((data) {
      final notificationData = Map<String, dynamic>.from(data);
      int? incomingConversationId = notificationData['conversation_id'];
      int? activeConversationId =
          getIt<PusherServices>().currentActiveConversationId;

      if (incomingConversationId != null &&
          incomingConversationId == activeConversationId) {
        debugPrint("💬 the user inside the same chat page");
        return;
      }

      String title = notificationData['title'] ?? 'New Message';
      String body = notificationData['body'] ?? '';

      LocalNotificationService.showNotification(title: title, body: body);
    });
  }
}
