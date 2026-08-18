import 'package:medics/core/utils/app_constant.dart';

class DoctorThreadModel {
  final int userId;
  final int doctorId;
  final String doctorName;
  final String? doctorImage;
  final String? lastMessage;
  final String? lastMessageTime;
  final int unreadCount;

  DoctorThreadModel({
    required this.userId,
    required this.doctorId,
    required this.doctorName,
    this.doctorImage,
    this.lastMessage,
    this.lastMessageTime,
    required this.unreadCount,
  });

  factory DoctorThreadModel.fromJson(Map<String, dynamic> json) {
    String? rawPhotoUrl = json["doctor_image"];
    if (rawPhotoUrl != null && rawPhotoUrl.contains('127.0.0.1')) {
      rawPhotoUrl = rawPhotoUrl.replaceAll(
        "http://127.0.0.1:8000",
        AppConstant.baseUrl,
      );
    }
    return DoctorThreadModel(
      userId: json['user_id'] ?? 0,
      doctorId: json['doctor_id'] ?? 0,
      doctorName: json['doctor_name'] ?? '',
      doctorImage: rawPhotoUrl,
      lastMessage: json['last_message'],
      lastMessageTime: json['last_message_time'],
      unreadCount: json['unread_count'] ?? 0,
    );
  }
}
