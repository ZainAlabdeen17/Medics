import 'package:medics/features/chat/domain/entities/message_entity.dart';

class ConversationMessagesEntity {
  final int? conversationId;
  final List<MessageEntity> messages;

  const ConversationMessagesEntity({
    required this.conversationId,
    required this.messages,
  });
}
