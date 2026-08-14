import 'package:medics/core/utils/app_constant.dart';

class MedicalTestModel {
  final String id;
  final String url;
  final String name;
  final String fileName;
  final String mimeType;
  final DateTime createdAt;

  MedicalTestModel({
    required this.id,
    required this.url,
    required this.name,
    required this.fileName,
    required this.mimeType,
    required this.createdAt,
  });

  factory MedicalTestModel.fromJson(Map<String, dynamic> json) {
    final rawUrl = json['url'] ?? '';
    final formattedUrl = rawUrl.replaceAll(
      "http://127.0.0.1:8000",
      AppConstant.baseUrl,
    );
    return MedicalTestModel(
      id: json['id'] ?? '',
      url: formattedUrl,
      name: json['name'] ?? '',
      fileName: json['file_name'] ?? '',
      mimeType: json['mime_type'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'name': name,
      'file_name': fileName,
      'mime_type': mimeType,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
