import 'package:medics/features/chat/domain/entities/message_entity.dart';

const _empty = Object();

class ChatState {
  final bool isLoading;
  final bool isSending;
  final String? errorMessage;
  final int? conversationId;
  final List<MessageEntity> messages;

  const ChatState({
    this.isLoading = false,
    this.isSending = false,
    this.errorMessage,
    this.conversationId,
    this.messages = const [],
  });
  
  ChatState copyWith({
    bool? isLoading,
    bool? isSending,
    Object? errorMessage = _empty,
    int? conversationId,
    List<MessageEntity>? messages,
  }) {
    return ChatState(
      isLoading: isLoading ?? this.isLoading,
      isSending: isSending ?? this.isSending,
      errorMessage: errorMessage == _empty
          ? this.errorMessage
          : errorMessage as String?,
      conversationId: conversationId ?? this.conversationId,
      messages: messages ?? this.messages,
    );
  }
}
