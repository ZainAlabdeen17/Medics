import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/features/chat/data/data_source/chat_remote_data_source.dart';
import 'package:medics/features/chat/data/models/conversation_messages_model.dart';
import 'package:medics/features/chat/data/models/message_model.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final ApiConsumer api;

  ChatRemoteDataSourceImpl({required this.api});
  @override
  Future<ConversationMessagesModel> getMessages({
    required int receiverId,
  }) async {
    final response = await api.get(path: 'chat/$receiverId/getmessages');
    return ConversationMessagesModel.fromJson(response);
  }

  @override
  Future<MessageModel> sendMessage({
    required int receiverId,
    required String body,
  }) async {
    final response = await api.post(
      path: 'chat/sendmessages',
      data: {'receiverId': receiverId, 'body': body},
    );
    return MessageModel.fromJson(response['data']);
  }
}
