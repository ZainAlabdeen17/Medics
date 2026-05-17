class HealthMetricModel {
  final BodyParametersModel body;
  final LifestyleModel lifestyle;
  final AnamnesisModel anamnesis;
  final String? notes;

  HealthMetricModel({
    required this.body,
    required this.lifestyle,
    required this.anamnesis,
    this.notes,
  });

  factory HealthMetricModel.empty() => HealthMetricModel(
        body: BodyParametersModel(),
        lifestyle: LifestyleModel(),
        anamnesis: AnamnesisModel(),
      );

  HealthMetricModel copyWith({
    BodyParametersModel? body,
    LifestyleModel? lifestyle,
    AnamnesisModel? anamnesis,
    String? notes,
  }) {
    return HealthMetricModel(
      body: body ?? this.body,
      lifestyle: lifestyle ?? this.lifestyle,
      anamnesis: anamnesis ?? this.anamnesis,
      notes: notes ?? this.notes,
    );
  }
}

class BodyParametersModel {
  final double? height, weight;
  final int? oxygen, heartRate, systolic, diastolic;
  final String? bloodType, rh;

  BodyParametersModel({
    this.height,
    this.weight,
    this.oxygen,
    this.heartRate,
    this.systolic,
    this.diastolic,
    this.bloodType,
    this.rh,
  });

  BodyParametersModel copyWith({
    double? height, weight,
    int? oxygen, heartRate, systolic, diastolic,
    String? bloodType, rh,
  }) {
    return BodyParametersModel(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      oxygen: oxygen ?? this.oxygen,
      heartRate: heartRate ?? this.heartRate,
      systolic: systolic ?? this.systolic,
      diastolic: diastolic ?? this.diastolic,
      bloodType: bloodType ?? this.bloodType,
      rh: rh ?? this.rh,
    );
  }
}

class LifestyleModel {
  final String? sleep, water, smoking, alcohol, activity;

  LifestyleModel({
    this.sleep,
    this.water,
    this.smoking,
    this.alcohol,
    this.activity,
  });

  LifestyleModel copyWith({
    String? sleep, water, smoking, alcohol, activity,
  }) {
    return LifestyleModel(
      sleep: sleep ?? this.sleep,
      water: water ?? this.water,
      smoking: smoking ?? this.smoking,
      alcohol: alcohol ?? this.alcohol,
      activity: activity ?? this.activity,
    );
  }
}

class AnamnesisModel {
  final List<String> conditions, allergies;

  AnamnesisModel({
    this.conditions = const [],
    this.allergies = const [],
  });

  AnamnesisModel copyWith({
    List<String>? conditions,
    List<String>? allergies,
  }) {
    return AnamnesisModel(
      conditions: conditions ?? this.conditions,
      allergies: allergies ?? this.allergies,
    );
  }
}