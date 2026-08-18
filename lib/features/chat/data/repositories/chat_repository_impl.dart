import 'package:dartz/dartz.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/chat/data/data_source/chat_remote_data_source.dart';
import 'package:medics/features/chat/domain/entities/conversation_messages_entity.dart';
import 'package:medics/features/chat/domain/entities/message_entity.dart';
import 'package:medics/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  ChatRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, ConversationMessagesEntity>> getMessages({
    required int receiverId,
  }) async {
    try {
      final result = await remoteDataSource.getMessages(receiverId: receiverId);
      return Right(result);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> sendMessage({
    required int receiverId,
    required String body,
  }) async {
    try {
      final result = await remoteDataSource.sendMessage(
        receiverId: receiverId,
        body: body,
      );
      return Right(result);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    }
  }
}
