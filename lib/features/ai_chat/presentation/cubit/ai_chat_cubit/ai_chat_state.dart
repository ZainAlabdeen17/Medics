import 'package:medics/features/ai_chat/data/models/message_model.dart';

abstract class AiChatState {}

final class AiChatInitial extends AiChatState {}

final class AiChatLoading extends AiChatState {}

final class AiChatLoaded extends AiChatState {
  final List<MessageModel> messages;
  final bool isTyping;

  AiChatLoaded({required this.messages, this.isTyping = false});
}

final class AiChatError extends AiChatState {
  final String message;

  AiChatError({required this.message});
}
