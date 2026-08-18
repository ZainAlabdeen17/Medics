class MessageEntity {
  final String id;
  final int? senderUserId;
  final String body;
  final bool isMine;
  final bool isRead;
  final String createdAt;
  final String timeDiff;

  MessageEntity({
    required this.id,
    required this.senderUserId,
    required this.body,
    required this.isMine,
    required this.isRead,
    required this.createdAt,
    required this.timeDiff,
  });
}
