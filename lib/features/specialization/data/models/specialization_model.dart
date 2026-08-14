class SpecializationModel {
  final String specialization;
  final int doctorsCount;
  final String icon;
  SpecializationModel({
    required this.specialization,
    required this.doctorsCount,
    required this.icon,
  });
  factory SpecializationModel.fromJson(Map<String, dynamic> json) {
    final rawSpec = json['specialization'].toString().toLowerCase().replaceAll(
      ' ',
      '',
    );
    return SpecializationModel(
      specialization: json['specialization'] ?? '',
      doctorsCount: json['doctors_count'] ?? 0,
      icon: "assets/images/icons/specializatios/$rawSpec.svg",
    );
  }
}

List<String> specializations = [
  'General Practitioner',
  'Pulmonologist',
  'Gastroenterologist',
  'Otolaryngologist',
  'Dentist',
  'Cardiologist',
  'Ophthalmologist',
  'Urologist',
  'Hepatologist',
  'Traumatologist',
  'Gynecologist',
  'Neurologist',
  'Geneticist',
  'Radiologist',
  'Pathologist',
];
