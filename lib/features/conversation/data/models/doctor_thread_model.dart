import 'package:medics/core/utils/app_constant.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';

class DoctorThreadModel {
  final int userId;
  final int doctorId;
  final String doctorName;
  final String? doctorImage;
  final String? lastMessage;
  final String? lastMessageTime;
  final int unreadCount;
  final DoctorModel doctor;

  DoctorThreadModel({
    required this.userId,
    required this.doctorId,
    required this.doctorName,
    this.doctorImage,
    this.lastMessage,
    this.lastMessageTime,
    required this.unreadCount,
    required this.doctor,
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
      doctor: DoctorModel.fromJson(json),
    );
  }
}
