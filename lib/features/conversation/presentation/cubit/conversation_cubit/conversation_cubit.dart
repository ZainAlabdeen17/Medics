import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/core/services/pusher_service.dart';
import 'package:medics/core/services/service_locator.dart';
import 'package:medics/features/conversation/data/repositories/conversation_repository.dart';
import 'package:medics/features/conversation/presentation/cubit/conversation_cubit/conversation_state.dart';

class ConversationsCubit extends Cubit<ConversationsState> {
  final ConversationRepository repository;
  StreamSubscription? _socketSubscription;
  ConversationsCubit(this.repository) : super(ConversationsInitial()) {
    fetchConversations();
    startListeningToSocketUpdates();
  }
  Future<void> fetchConversations({bool? withoutLoading}) async {
    if (state is! ConversationsLoaded) {
      if (withoutLoading != true) {
        emit(ConversationsLoading());
      }
    }
    final result = await repository.getDoctorThreads();
    result.fold(
      (failure) {
        if (!isClosed) emit(ConversationsError(failure.message));
      },
      (conversations) {
        if (!isClosed) emit(ConversationsLoaded(conversations));
      },
    );
  }

  void startListeningToSocketUpdates() {
    _socketSubscription?.cancel();

    _socketSubscription = getIt<PusherServices>().globalStream.listen((data) {
      debugPrint("📡 [Socket] Data received in Global Listener: $data");
      fetchConversations();
    });
  }

  @override
  Future<void> close() {
    _socketSubscription?.cancel();
    return super.close();
  }
}
