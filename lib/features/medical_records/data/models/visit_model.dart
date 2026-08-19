import 'package:medics/core/utils/app_constant.dart';

class VisitModel {
  final int id;
  final DateTime visitDate;

  final int doctorId;
  final String doctorName;
  final String doctorSpecialization;
  final String doctorPhotoUrl;

  final String anamnesis;
  final List<String> symptoms;
  final String diagnosis;
  final String? nextVisitDate;

  VisitModel({
    required this.id,
    required this.visitDate,
    required this.doctorId,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.doctorPhotoUrl,
    required this.anamnesis,
    required this.symptoms,
    required this.diagnosis,
    this.nextVisitDate,
  });

  factory VisitModel.fromJson(Map<String, dynamic> json) {
    final doctor = json['doctor'] as Map<String, dynamic>? ?? {};
    final consultation = json['consultation'] as Map<String, dynamic>? ?? {};

    final rawPhotoUrl = doctor['photo_url'] ?? '';
    final formattedPhotoUrl = rawPhotoUrl.replaceAll(
      "http://127.0.0.1:8000",
      AppConstant.baseUrl,
    );

    return VisitModel(
      id: json['id'] ?? 0,
      visitDate: DateTime.tryParse(json['visit_date'] ?? '') ?? DateTime.now(),
      doctorId: doctor['id'] ?? 0,
      doctorName: doctor['name'] ?? '',
      doctorSpecialization: doctor['specialization'] ?? '',
      doctorPhotoUrl: formattedPhotoUrl,
      anamnesis: consultation['anamnesis'] ?? 'not specified',
      symptoms: consultation['symptoms'] != null
          ? List<String>.from(consultation['symptoms'])
          : ["not specified"],
      diagnosis: consultation['diagnosis'] ?? 'not specified',
      nextVisitDate: consultation['next_visit_date'],
    );
  }
}
