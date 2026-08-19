import 'package:flutter/material.dart';
import 'package:medics/features/ai_chat/data/models/message_model.dart';
import 'package:medics/features/ai_chat/presentation/widgets/ai_type_indicator.dart';
import 'package:medics/features/chat/presentation/widgets/incoming_message_bubble.dart';
import 'package:medics/features/chat/presentation/widgets/outgoing_message_bubble.dart';

class AiMessagesList extends StatelessWidget {
  const AiMessagesList({
    super.key,
    required this.messages,
    required this.isTyping,
    required this.scrollController,
  });

  final List<MessageModel> messages;
  final bool isTyping;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final itemCount = messages.length + (isTyping ? 1 : 0);

    return ListView.builder(
      controller: scrollController,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (index == messages.length && isTyping) {
          return const AiTypingIndicator();
        }

        final message = messages[index];

        return message.isMine
            ? OutgoingMessageBubble(
                body: message.body,
                time: message.createdAt,
              )
            : IncomingMessageBubble(
                sender: "Medics AI",
                body: message.body,
                time: message.createdAt,
              );
      },
    );
  }
}