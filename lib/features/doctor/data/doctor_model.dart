import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_strings.dart';

class DoctorModel {
  final String name;
  final String specialization;
  final String image;
  final double rating;

  DoctorModel({
    required this.name,
    required this.specialization,
    required this.image,
    required this.rating,
  });
}

final List<DoctorModel> doctors = [
  DoctorModel(
    name: "Dr. Mia Miller",
    specialization: AppStrings.neurologist,
    image: Assets.assetsImagesDoctorsDoctor1,
    rating: 5.0,
  ),
  DoctorModel(
    name: "Dr. Norah Still",
    specialization: AppStrings.cardiologist,
    image: Assets.assetsImagesDoctorsDoctor2,
    rating: 4.9,
  ),
  DoctorModel(
    name: "Dr. Helena Fox",
    specialization: AppStrings.radiologist,
    image: Assets.assetsImagesDoctorsDoctor3,
    rating: 4.8,
  ),
  DoctorModel(
    name: "Dr. Andrew Miller",
    specialization: AppStrings.dentist,
    image: Assets.assetsImagesDoctorsDoctor4,
    rating: 3.2,
  ),
];
