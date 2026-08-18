import 'package:dartz/dartz.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/chat/domain/entities/conversation_messages_entity.dart';
import 'package:medics/features/chat/domain/repositories/chat_repository.dart';

class GetMessagesUseCase {
  final ChatRepository repository;

  GetMessagesUseCase({required this.repository});
  Future<Either<Failure, ConversationMessagesEntity>> call({
    required int receiverId,
  }) {
    return repository.getMessages(receiverId: receiverId);
  }
}
