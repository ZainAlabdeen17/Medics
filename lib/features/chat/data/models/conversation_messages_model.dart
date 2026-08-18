import 'package:medics/features/chat/data/models/message_model.dart';
import 'package:medics/features/chat/domain/entities/conversation_messages_entity.dart';

class ConversationMessagesModel extends ConversationMessagesEntity {
  ConversationMessagesModel({
    required super.conversationId,
    required super.messages,
  });

  factory ConversationMessagesModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return ConversationMessagesModel(
      conversationId: data['conversation_id'],
      messages: (data['messages'] as List)
          .map((message) => MessageModel.fromJson(message))
          .toList(),
    );
  }
}
