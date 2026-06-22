import 'package:medics/core/utils/app_assets.dart';

class SpecializationModel {
  final String id;
  final String name;
  final String icon;
  final int doctorsCount;

  SpecializationModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.doctorsCount,
  });
}

final List<SpecializationModel> specializations = [
  SpecializationModel(
    id: 'General Practitioner',
    name: 'General Practitioner',
    icon: Assets.assetsImagesIconsSpecializatiosGeneralPractitioner,
    doctorsCount: 15,
  ),
  SpecializationModel(
    id: 'pulmonologist',
    name: 'Pulmonologist',
    icon: Assets.assetsImagesIconsSpecializatiosPulmonologist,
    doctorsCount: 19,
  ),
  SpecializationModel(
    id: 'gastroenterologist',
    name: 'Gastroenterologist',
    icon: Assets.assetsImagesIconsSpecializatiosGastroenterologist,
    doctorsCount: 8,
  ),
  SpecializationModel(
    id: 'otolaryngologist',
    name: 'Otolaryngologist',
    icon: Assets.assetsImagesIconsSpecializatiosOtolaryngologist,
    doctorsCount: 19,
  ),
  SpecializationModel(
    id: 'dentist',
    name: 'Dentist',
    icon: Assets.assetsImagesIconsSpecializatiosDentist,
    doctorsCount: 21,
  ),
  SpecializationModel(
    id: 'cardiologist',

    name: 'Cardiologist',
    icon: Assets.assetsImagesIconsSpecializatiosCardiologist,
    doctorsCount: 15,
  ),
  SpecializationModel(
    id: 'ophthalmologist',
    name: 'Ophthalmologist',
    icon: Assets.assetsImagesIconsSpecializatiosOphthalmologist,
    doctorsCount: 13,
  ),
  SpecializationModel(
    id: 'urologist',
    name: 'Urologist',
    icon: Assets.assetsImagesIconsSpecializatiosUrologist,
    doctorsCount: 10,
  ),
  SpecializationModel(
    id: 'hepatologist',
    name: 'Hepatologist',
    icon: Assets.assetsImagesIconsSpecializatiosHepatologist,
    doctorsCount: 9,
  ),
  SpecializationModel(
    id: 'traumatologist',
    name: 'Traumatologist',
    icon: Assets.assetsImagesIconsSpecializatiosTraumatologist,
    doctorsCount: 12,
  ),
  SpecializationModel(
    id: 'gynecologist',
    name: 'Gynecologist',
    icon: Assets.assetsImagesIconsSpecializatiosGynecologist,
    doctorsCount: 17,
  ),
  SpecializationModel(
    id: 'neurologist',
    name: 'Neurologist',
    icon: Assets.assetsImagesIconsSpecializatiosNeurologist,
    doctorsCount: 15,
  ),
  SpecializationModel(
    id: 'geneticist',
    name: 'Geneticist',
    icon: Assets.assetsImagesIconsSpecializatiosGeneticist,
    doctorsCount: 7,
  ),
];
