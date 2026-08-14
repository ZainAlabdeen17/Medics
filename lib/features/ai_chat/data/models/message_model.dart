class MessageModel {
  final String id;
  final bool isMine;
  final String body;
  final String createdAt;
  final String? timeDiff;

  MessageModel({
    required this.id,
    required this.isMine,
    required this.body,
    required this.createdAt,
    this.timeDiff,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'] as Map<String, dynamic>? ?? {};
    return MessageModel(
      id: json['id']?.toString() ?? '',
      isMine: attributes['is_mine'] as bool? ?? false,
      body: attributes['body'] as String? ?? '',
      createdAt: attributes['created_at'] as String? ?? '',
      timeDiff: attributes['time_diff'] as String?,
    );
  }
}
