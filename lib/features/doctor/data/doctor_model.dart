import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_strings.dart';

class DoctorModel {
  final int id;
  final String name;
  final String specialization;
  final String image;
  final double rating;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.image,
    required this.rating,
  });
  static List<DoctorModel> getDoctors() {
    return [
      DoctorModel(
        id: 5874658,
        name: "Dr. Mia Miller",
        specialization: AppStrings.neurologist,
        image: Assets.assetsImagesDoctorsDoctor1,
        rating: 5.0,
      ),
      DoctorModel(
        id: 1492357,
        name: "Dr. Norah Still",
        specialization: AppStrings.cardiologist,
        image: Assets.assetsImagesDoctorsDoctor2,
        rating: 4.9,
      ),
      DoctorModel(
        id: 7785691,
        name: "Dr. Helena Fox",
        specialization: AppStrings.radiologist,
        image: Assets.assetsImagesDoctorsDoctor3,
        rating: 4.8,
      ),
      DoctorModel(
        id: 4397615,
        name: "Dr. Andrew Miller",
        specialization: AppStrings.dentist,
        image: Assets.assetsImagesDoctorsDoctor4,
        rating: 3.2,
      ),
      DoctorModel(
        id: 1298453,
        name: "Dr. Jack Buckly",
        specialization: AppStrings.pulmonologist,
        image: Assets.assetsImagesDoctorsDoctor7,
        rating: 4.1,
      ),
      DoctorModel(
        id: 7193825,
        name: "Dr. Anya Taylor Joe",
        specialization: AppStrings.gynecologist,
        image: Assets.assetsImagesDoctorsDoctor8,
        rating: 3.7,
      ),
      DoctorModel(
        id: 9146372,
        name: "Dr. Noa Brown",
        specialization: AppStrings.urologist,
        image: Assets.assetsImagesDoctorsDoctor6,
        rating: 5.0,
      ),
      DoctorModel(
        id: 8921476,
        name: "Dr. Sara Palm",
        specialization: AppStrings.traumatologist,
        image: Assets.assetsImagesDoctorsDoctor5,
        rating: 4.3,
      ),
    ];
  }
}
