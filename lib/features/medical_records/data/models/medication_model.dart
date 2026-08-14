class PrescriptionModel {
  final int id;
  final String name;
  final String category;
  final String dosage;
  final String formAndQuantity;
  final String frequency;
  final String duration;
  final int doctorId;
  final String doctorName;
  final String instructions;
  final DateTime date;

  PrescriptionModel({
    required this.id,
    required this.name,
    required this.category,
    required this.dosage,
    required this.formAndQuantity,
    required this.frequency,
    required this.duration,
    required this.doctorId,
    required this.doctorName,
    required this.instructions,
    required this.date,
  });
  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionModel(
      id: json['id'],
      name: json['medicine_name'],
      category: json['category'],
      dosage: json['dosage'],
      formAndQuantity: json['form_and_quantity'],
      frequency: json['frequency'],
      duration: json['duration'],
      doctorId: json['doctor']['id'],
      doctorName: json['doctor']['name'],
      instructions: json['special_instructions'],
      date: DateTime.parse(json['prescribed_on']),
    );
  }
}
