import 'package:medics/core/utils/app_assets.dart';

class DoctorModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String specialization;
  final String education;
  final String certification;
  final String yearsOfExperience;
  final String gender;
  final String licenseNumber;
  final String bio;
  final String sessionPrice;
  final String photoUrl;

  DoctorModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.specialization,
    required this.education,
    required this.certification,
    required this.yearsOfExperience,
    required this.gender,
    required this.licenseNumber,
    required this.bio,
    required this.sessionPrice,
    required this.photoUrl,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    final attributes = json["attributes"];
    final user = json["relationships"]["user"];
    return DoctorModel(
      id: json["id"],
      firstName: user["first_name"],
      lastName: user["last_name"],
      email: user["email"],
      specialization: attributes["specialization"],
      education: attributes["education"],
      certification: attributes["certification"],
      yearsOfExperience: attributes["years_of_experience"],
      gender: attributes["gender"],
      licenseNumber: attributes["license_number"],
      bio: attributes["bio"],
      sessionPrice: attributes["session_price"],
      photoUrl: attributes["photo_url"],
    );
  }
}

const List<String> doctorImages = [
  Assets.assetsImagesDoctorsDoctor1,
  Assets.assetsImagesDoctorsDoctor2,
  Assets.assetsImagesDoctorsDoctor3,
  Assets.assetsImagesDoctorsDoctor4,
  Assets.assetsImagesDoctorsDoctor5,
  Assets.assetsImagesDoctorsDoctor6,
  Assets.assetsImagesDoctorsDoctor7,
  Assets.assetsImagesDoctorsDoctor8,
  Assets.assetsImagesDoctorsDoctor9,
  Assets.assetsImagesDoctorsDoctor5,
  Assets.assetsImagesDoctorsDoctor4,
  Assets.assetsImagesDoctorsDoctor7,
  Assets.assetsImagesDoctorsDoctor1,
  Assets.assetsImagesDoctorsDoctor8,
];
