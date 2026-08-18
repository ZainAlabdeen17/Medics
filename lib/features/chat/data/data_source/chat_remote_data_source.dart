import 'package:medics/features/chat/data/models/conversation_messages_model.dart';
import 'package:medics/features/chat/data/models/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<ConversationMessagesModel> getMessages({required int receiverId});
  Future<MessageModel> sendMessage({
    required int receiverId,
    required String body,
  });
}
