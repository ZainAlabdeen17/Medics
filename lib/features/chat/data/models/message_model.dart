import 'package:medics/features/chat/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required super.id,
    required super.senderUserId,
    required super.body,
    required super.isMine,
    required super.isRead,
    required super.createdAt,
    required super.timeDiff,
  });
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];
    return MessageModel(
      id: json['id'].toString(),
      senderUserId: attributes['sender_user_id'],
      body: attributes['body'] ?? '',
      isMine: attributes['is_mine'] ?? false,
      isRead: attributes['is_read'] ?? false,
      createdAt: attributes['created_at'] ?? '',
      timeDiff: attributes['time_diff'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'attributes': {
        'sender_user_id': senderUserId,
        'body': body,
        'is_mine': isMine,
        'is_read': isRead,
        'created_at': createdAt,
        'time_diff': timeDiff,
      },
    };
  }

  static MessageEntity toMessageEntity(MessageModel message) {
    return MessageEntity(
      id: message.id,
      body: message.body,
      senderUserId: message.senderUserId,
      isMine: false,
      isRead: message.isRead,
      createdAt: message.createdAt,
      timeDiff: message.timeDiff,
    );
  }
}

extension MessageMapper on MessageModel {
  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      body: body,
      senderUserId: senderUserId,
      isMine: false,
      isRead: isRead,
      createdAt: createdAt,
      timeDiff: timeDiff,
    );
  }
}
