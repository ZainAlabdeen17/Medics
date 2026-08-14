import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/ai_chat/data/models/message_model.dart';

class AiChatRepository {
  final ApiConsumer api;

  AiChatRepository({required this.api});

  Future<Either<Failure, List<MessageModel>>> getChatHistory() async {
    try {
      final response = await api.get(path: 'ai-chat/history');
      final dataList = response['data'] as List<dynamic>? ?? [];
      final messages = dataList
          .map((msg) => MessageModel.fromJson(msg as Map<String, dynamic>))
          .toList();
      return right(messages);
    } on ServerExeption catch (e) {
      return left(e.failure);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, MessageModel>> sendMessage({
    required String message,
  }) async {
    try {
      final response = await api.post(
        path: 'ai-chat/send',
        data: {'body': message},
      );
      final messageData = response['data'] as Map<String, dynamic>;
      return right(MessageModel.fromJson(messageData));
    } on ServerExeption catch (e) {
      return left(e.failure);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
