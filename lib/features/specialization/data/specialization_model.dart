import 'package:medics/core/utils/app_assets.dart';

class SpecializationModel {
  final String name;
  final String icon;
  final int doctorsCount;

  SpecializationModel({
    required this.name,
    required this.icon,
    required this.doctorsCount,
  });
}

final List<SpecializationModel> specializations = [
  SpecializationModel(
    name: 'General Practitioner',
    icon: Assets.assetsImagesIconsSpecializatiosGeneralPractitioner,
    doctorsCount: 15,
  ),
  SpecializationModel(
    name: 'Pulmonologist',
    icon: Assets.assetsImagesIconsSpecializatiosPulmonologist,
    doctorsCount: 19,
  ),
  SpecializationModel(
    name: 'Gastroenterologist',
    icon: Assets.assetsImagesIconsSpecializatiosGastroenterologist,
    doctorsCount: 8,
  ),
  SpecializationModel(
    name: 'Otolaryngologist',
    icon: Assets.assetsImagesIconsSpecializatiosOtolaryngologist,
    doctorsCount: 19,
  ),
  SpecializationModel(
    name: 'Dentist',
    icon: Assets.assetsImagesIconsSpecializatiosDentist,
    doctorsCount: 21,
  ),
  SpecializationModel(
    name: 'Cardiologist',
    icon: Assets.assetsImagesIconsSpecializatiosCardiologist,
    doctorsCount: 15,
  ),
  SpecializationModel(
    name: 'Ophthalmologist',
    icon: Assets.assetsImagesIconsSpecializatiosOphthalmologist,
    doctorsCount: 13,
  ),
  SpecializationModel(
    name: 'Urologist',
    icon: Assets.assetsImagesIconsSpecializatiosUrologist,
    doctorsCount: 10,
  ),
  SpecializationModel(
    name: 'Hepatologist',
    icon: Assets.assetsImagesIconsSpecializatiosHepatologist,
    doctorsCount: 9,
  ),
  SpecializationModel(
    name: 'Traumatologist',
    icon: Assets.assetsImagesIconsSpecializatiosTraumatologist,
    doctorsCount: 12,
  ),
  SpecializationModel(
    name: 'Gynecologist',
    icon: Assets.assetsImagesIconsSpecializatiosGynecologist,
    doctorsCount: 17,
  ),
  SpecializationModel(
    name: 'Neurologist',
    icon: Assets.assetsImagesIconsSpecializatiosNeurologist,
    doctorsCount: 15,
  ),
  SpecializationModel(
    name: 'Geneticist',
    icon: Assets.assetsImagesIconsSpecializatiosGeneticist,
    doctorsCount: 7,
  ),
];
