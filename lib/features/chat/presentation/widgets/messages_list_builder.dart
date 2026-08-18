import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/chat/domain/entities/message_entity.dart';
import 'package:medics/features/chat/presentation/cubit/chat_cubit/chat_cubit.dart';
import 'package:medics/features/chat/presentation/widgets/incoming_message_bubble.dart';
import 'package:medics/features/chat/presentation/widgets/outgoing_message_bubble.dart';

class MessagesListBuilder extends StatelessWidget {
  const MessagesListBuilder({
    super.key,
    required this.sender,
    required this.messages,
  });
  final List<MessageEntity> messages;
  final String sender;

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.read<ChatCubit>();
    return ListView.builder(
      controller: chatCubit.scrollController,
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return message.isMine
            ? OutgoingMessageBubble(body: message.body, time: message.createdAt)
            : IncomingMessageBubble(
                sender: sender,
                body: message.body,
                time: message.createdAt,
              );
      },
    );
  }
}
