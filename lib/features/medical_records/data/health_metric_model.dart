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

  // عشان نعمل نسخة فاضية في البداية
  factory HealthMetricModel.empty() => HealthMetricModel(
    body: BodyParametersModel(),
    lifestyle: LifestyleModel(),
    anamnesis: AnamnesisModel(),
    notes: '',
  );

  // تحويل البيانات لـ JSON عشان نحفظها
  Map<String, dynamic> toJson() => {
    'body': body.toJson(),
    'lifestyle': lifestyle.toJson(),
    'anamnesis': anamnesis.toJson(),
    'notes': notes,
  };

  // تحويل الـ JSON لـ Model عشان نقراها
  factory HealthMetricModel.fromJson(Map<String, dynamic> json) {
    final notesRaw = json['notes'];

    String? notes;

    if (notesRaw is List) {
      notes = notesRaw.join(', ');
    } else if (notesRaw is String) {
      notes = notesRaw;
    }

    return HealthMetricModel(
      body: BodyParametersModel.fromJson(json['body'] ?? {}),
      lifestyle: LifestyleModel.fromJson(json['lifestyle'] ?? {}),
      anamnesis: AnamnesisModel.fromJson(json['anamnesis'] ?? {}),
      notes: notes ?? '',
    );
  }

  HealthMetricModel copyWith({
    BodyParametersModel? body,
    LifestyleModel? lifestyle,
    AnamnesisModel? anamnesis,
    String? notes,
  }) => HealthMetricModel(
    body: body ?? this.body,
    lifestyle: lifestyle ?? this.lifestyle,
    anamnesis: anamnesis ?? this.anamnesis,
    notes: notes ?? this.notes,
  );
}

// ----------------------------------------

class BodyParametersModel {
  final double? height;
  final double? weight;
  final int? oxygen;
  final int? heartRate;
  final int? systolic;
  final int? diastolic;
  final String? bloodType;
  final String? rh;

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

  Map<String, dynamic> toJson() => {
    'height': height,
    'weight': weight,
    'oxygen': oxygen,
    'heartRate': heartRate,
    'systolic': systolic,
    'diastolic': diastolic,
    'bloodType': bloodType,
    'rh': rh,
  };

  factory BodyParametersModel.fromJson(Map<String, dynamic> json) =>
      BodyParametersModel(
        height: (json['height'] as num?)?.toDouble(),
        weight: (json['weight'] as num?)?.toDouble(),
        oxygen: json['oxygen'] as int?,
        heartRate: json['heartRate'] as int?,
        systolic: json['systolic'] as int?,
        diastolic: json['diastolic'] as int?,
        bloodType: json['bloodType'] as String?,
        rh: json['rh'] as String?,
      );
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

  LifestyleModel copyWith({String? sleep, water, smoking, alcohol, activity}) {
    return LifestyleModel(
      sleep: sleep ?? this.sleep,
      water: water ?? this.water,
      smoking: smoking ?? this.smoking,
      alcohol: alcohol ?? this.alcohol,
      activity: activity ?? this.activity,
    );
  }

  Map<String, dynamic> toJson() => {
    'sleep': sleep,
    'water': water,
    'smoking': smoking,
    'alcohol': alcohol,
    'activity': activity,
  };

  factory LifestyleModel.fromJson(Map<String, dynamic> json) => LifestyleModel(
    sleep: json['sleep'] as String?,
    water: json['water'] as String?,
    smoking: json['smoking'] as String?,
    alcohol: json['alcohol'] as String?,
    activity: json['activity'] as String?,
  );
}

class AnamnesisModel {
  final String? conditions;
  final String? allergies;

  AnamnesisModel({this.conditions, this.allergies});

  AnamnesisModel copyWith({String? conditions, String? allergies}) {
    return AnamnesisModel(
      conditions: conditions ?? this.conditions,
      allergies: allergies ?? this.allergies,
    );
  }

  Map<String, dynamic> toJson() => {
    'conditions': conditions,
    'allergies': allergies,
  };

  factory AnamnesisModel.fromJson(Map<String, dynamic> json) {
    String? parseField(dynamic value) {
      if (value is List) return value.join(', ');
      if (value is String) return value;
      return null;
    }

    return AnamnesisModel(
      conditions: parseField(json['conditions']),
      allergies: parseField(json['allergies']),
    );
  }
}
