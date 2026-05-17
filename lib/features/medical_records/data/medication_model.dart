class Medication {
  final String name;
  final String? description;
  final DateTime startDate;
  final DateTime endDate;
  final Dosage dosage;
  final int timesPerDay;
  final String prescribedBy;
  final String specialInstructions;
  final String storage;
  final String sideEffects;
  final String allergyWarning;

  const Medication({
    required this.name,
    this.description,
    required this.startDate,
    required this.endDate,
    required this.dosage,
    required this.timesPerDay,
    required this.prescribedBy,
    required this.specialInstructions,
    required this.storage,
    required this.sideEffects,
    required this.allergyWarning,
  });

  @override
  String toString() =>
      'الدواء: $name | الجرعة: $dosage | $timesPerDay مرة/يوم | الطبيب: $prescribedBy';

  static List<Medication> getMedications() {
    return [
      Medication(
        name: 'Amoxicillin',
        startDate: DateTime(2024, 5, 14),
        endDate: DateTime(2024, 5, 30),
        dosage: const Dosage(1, 'capsule', '250mg'),
        timesPerDay: 1,
        prescribedBy: 'Dr. Mia Miller',
        specialInstructions:
            'Take with food to avoid stomach upset.\nDo not skip doses, even if symptoms improve.',
        storage: 'Store at room temperature, away from moisture and sunlight.',
        sideEffects:
            'Possible nausea, diarrhea, or mild rash. Contact your doctor if severe.',
        allergyWarning:
            'Avoid if allergic to penicillin or similar antibiotics.',
      ),
      Medication(
        name: 'Paracetamol',
        startDate: DateTime(2024, 6, 1),
        endDate: DateTime(2024, 6, 7),
        dosage: const Dosage(2, 'tablet', '500mg'),
        timesPerDay: 3,
        prescribedBy: 'Dr. John Smith',
        specialInstructions:
            'Take after meals. Do not exceed 8 tablets in 24 hours.',
        storage: 'Store below 25°C, protect from light.',
        sideEffects:
            'Rarely, skin rash or allergic reaction. Seek help if breathing difficulties occur.',
        allergyWarning: 'Do not use if allergic to paracetamol.',
      ),
      Medication(
        name: 'Ibuprofen',
        startDate: DateTime(2024, 7, 10),
        endDate: DateTime(2024, 7, 17),
        dosage: const Dosage(1, 'tablet', '400mg'),
        timesPerDay: 3,
        prescribedBy: 'Dr. Sarah Ahmed',
        specialInstructions:
            'Take with food or milk. Do not lie down for 10 minutes after taking.',
        storage: 'Keep in a dry place below 25°C.',
        sideEffects: 'May cause heartburn, nausea, or headache.',
        allergyWarning:
            'Avoid if allergic to NSAIDs (e.g., aspirin) or have a history of stomach ulcers.',
      ),
      Medication(
        name: 'Metformin',
        startDate: DateTime(2024, 8, 5),
        endDate: DateTime(2024, 8, 20),
        dosage: const Dosage(1, 'tablet', '500mg'),
        timesPerDay: 2,
        prescribedBy: 'Dr. Khaled Youssef',
        specialInstructions:
            'Take with meals to reduce stomach upset. Swallow whole with water.',
        storage: 'Keep at room temperature away from heat and moisture.',
        sideEffects:
            'Nausea, vomiting, or diarrhea may occur at the start. Contact doctor if severe.',
        allergyWarning:
            'Not suitable if allergic to metformin or have severe kidney disease.',
      ),

      Medication(
        name: 'Azithromycin',
        startDate: DateTime(2024, 9, 1),
        endDate: DateTime(2024, 9, 5),
        dosage: const Dosage(1, 'capsule', '250mg'),
        timesPerDay: 1,
        prescribedBy: 'Dr. Layla Hassan',
        specialInstructions:
            'Take on an empty stomach (1 hour before or 2 hours after food). Finish the whole course.',
        storage: 'Store at room temperature in a dry place.',
        sideEffects:
            'Diarrhea, nausea, abdominal pain. Inform doctor if you notice severe skin reaction.',
        allergyWarning:
            'Avoid if allergic to azithromycin, erythromycin, or any macrolide antibiotics.',
      ),
      Medication(
        name: 'Omeprazole',
        startDate: DateTime(2024, 10, 12),
        endDate: DateTime(2024, 10, 25),
        dosage: const Dosage(1, 'capsule', '20mg'),
        timesPerDay: 1,
        prescribedBy: 'Dr. Omar Ali',
        specialInstructions:
            'Take before a meal, preferably in the morning. Swallow whole.',
        storage: 'Store in a dry place below 30°C.',
        sideEffects:
            'Headache, stomach pain, or constipation may occur. Long-term use requires monitoring.',
        allergyWarning:
            'Do not use if allergic to omeprazole or other proton pump inhibitors.',
      ),
    ];
  }
}

class Dosage {
  final int quantity;
  final String form;
  final String strength;

  const Dosage(this.quantity, this.form, this.strength);

  @override
  String toString() => '$quantity $form ($strength)';
}
