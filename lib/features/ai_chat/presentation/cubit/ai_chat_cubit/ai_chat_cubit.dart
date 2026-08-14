import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/ai_chat/data/models/message_model.dart';
import 'package:medics/features/ai_chat/data/repositories/ai_chat_repository.dart';
import 'package:medics/features/ai_chat/presentation/cubit/ai_chat_cubit/ai_chat_state.dart';

class AiChatCubit extends Cubit<AiChatState> {
  final AiChatRepository repository;
  AiChatCubit(this.repository) : super(AiChatInitial());
  List<MessageModel> _messages = [];

  Future<void> fetchHistory() async {
    emit(AiChatLoading());
    final result = await repository.getChatHistory();

    result.fold(
      (failure) {
        emit(AiChatError(message: failure.message));
      },
      (messages) {
        _messages = messages;
        emit(AiChatLoaded(messages: List.from(_messages)));
      },
    );
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final userMsg = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      isMine: true,
      body: text,
      createdAt: DateTime.now().toIso8601String(),
    );

    _messages.add(userMsg);
    emit(AiChatLoaded(messages: List.from(_messages), isTyping: true));

    final result = await repository.sendMessage(message: text);

    result.fold(
      (failure) {
        _messages.removeLast();
        emit(AiChatLoaded(messages: List.from(_messages), isTyping: false));
        emit(AiChatError(message: failure.message));
      },
      (aiMessage) {
        _messages.add(aiMessage);
        emit(AiChatLoaded(messages: List.from(_messages), isTyping: false));
      },
    );
  }
}
