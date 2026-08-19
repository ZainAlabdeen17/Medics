import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/core/functions/user_functions.dart';
import 'package:medics/core/services/pusher_service.dart';
import 'package:medics/core/services/service_locator.dart';
import 'package:medics/features/chat/data/models/message_model.dart';
import 'package:medics/features/chat/domain/usecases/get_messages_use_case.dart';
import 'package:medics/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:medics/features/chat/presentation/cubit/chat_cubit/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetMessagesUseCase getMessagesUseCase;
  final SendMessageUseCase sendMessageUseCase;
  StreamSubscription? _messageSubscription;

  TextEditingController inputController = TextEditingController();
  ScrollController scrollController = ScrollController();

  ChatCubit(this.getMessagesUseCase, this.sendMessageUseCase)
    : super(ChatState());

  void loadMessages({required int receiverId}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getMessagesUseCase.call(receiverId: receiverId);
    if (isClosed) return;
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (conversation) async {
        emit(
          state.copyWith(
            isLoading: false,
            conversationId: conversation.conversationId,
            messages: conversation.messages,
          ),
        );
        if (conversation.conversationId != null) {
          getIt<PusherServices>().currentActiveConversationId =
              conversation.conversationId;
          await getIt<PusherServices>().subscribeToChat(
            conversationId: conversation.conversationId!,
          );

          await _messageSubscription?.cancel();

          _messageSubscription = getIt<PusherServices>().chatStream.listen((
            data,
          ) {
            debugPrint('Start receiving message inside chat room');

            final message = MessageModel.toMessageEntity(
              MessageModel.fromJson(data['message']),
            );
            final isMine =
                message.senderUserId.toString() ==
                UserFunctions.getUser()?.id.toString();

            if (isMine) return;
            emit(state.copyWith(messages: [...state.messages, message]));
          });
        }
      },
    );
  }

  void sendMessage({required int receiverId, required String body}) async {
    emit(state.copyWith(isSending: true, errorMessage: null));
    final result = await sendMessageUseCase.call(
      receiverId: receiverId,
      body: body,
    );
    if (isClosed) return;
    result.fold(
      (failure) =>
          emit(state.copyWith(isSending: false, errorMessage: failure.message)),
      (message) {
        emit(
          state.copyWith(
            isSending: false,
            messages: [...state.messages, message],
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    getIt<PusherServices>().unsubscribeFromChat();
    getIt<PusherServices>().currentActiveConversationId = null;
    inputController.dispose();
    scrollController.dispose();
    return super.close();
  }
}
