import 'package:dartz/dartz.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/chat/domain/entities/conversation_messages_entity.dart';
import 'package:medics/features/chat/domain/entities/message_entity.dart';

abstract class ChatRepository {
  Future<Either<Failure, ConversationMessagesEntity>> getMessages({
    required int receiverId,
  });
  Future<Either<Failure, MessageEntity>> sendMessage({
    required int receiverId,
    required String body,
  });
}
