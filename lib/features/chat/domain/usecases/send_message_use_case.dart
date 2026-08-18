import 'package:dartz/dartz.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/chat/domain/entities/message_entity.dart';
import 'package:medics/features/chat/domain/repositories/chat_repository.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase({required this.repository});
  Future<Either<Failure, MessageEntity>> call({
    required int receiverId,
    required String body,
  }) {
    return repository.sendMessage(receiverId: receiverId, body: body);
  }
}
