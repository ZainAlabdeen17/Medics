// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:medics/features/ai_chat/data/models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMine = message.isMine;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      child: Row(
        mainAxisAlignment: isMine
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMine) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: theme.primaryColor.withOpacity(0.1),
              child: Icon(
                Icons.smart_toy_outlined,
                size: 18,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(width: 8),
          ],

          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isMine
                    ? theme.primaryColor
                    : theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isMine ? 16 : 4),
                  bottomRight: Radius.circular(isMine ? 4 : 16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.body,
                    style: TextStyle(
                      color: isMine
                          ? Colors.white
                          : theme.textTheme.bodyLarge?.color,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  if (message.timeDiff != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      message.timeDiff!,
                      style: TextStyle(
                        fontSize: 10,
                        color: isMine ? Colors.white70 : Colors.grey,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
