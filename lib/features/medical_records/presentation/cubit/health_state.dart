// health_state.dart
import 'package:medics/features/medical_records/data/health_metric_model.dart';

class HealthState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  // Body Parameters
  final String height;
  final String weight;
  final String oxygen;
  final String heartRate;
  final String bloodPressure;
  final String systolic;
  final String diastolic;
  
  final String bloodType;
  final String rh;

  // Lifestyle
  final String sleep;
  final String water;
  final String smoking;
  final String alcohol;
  final String activity;

  // Anamnesis
  final String conditions;
  final String allergies;

  // Notes
  final String notes;

  const HealthState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.height = '',
    this.weight = '',
    this.oxygen = '',
    this.bloodPressure = '',
    this.heartRate = '',
    this.systolic = '',
    this.diastolic = '',
    this.bloodType = 'B',
    this.rh = '+',
    this.sleep = '',
    this.water = '',
    this.smoking = '',
    this.alcohol = '',
    this.activity = '',
    this.conditions = '',
    this.allergies = '',
    this.notes = '',
  });

  // BMI محسوب مباشرة من الـ state
  String? get bmi {
    final h = double.tryParse(height);
    final w = double.tryParse(weight);
    if (h == null || w == null || h <= 0) return null;
    final heightInMeters = h / 100;
    return (w / (heightInMeters * heightInMeters)).toStringAsFixed(1);
  }

  HealthState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    String? height,
    String? weight,
    String? oxygen,
    String? heartRate,
    String? systolic,
    String? diastolic,
    String? bloodPressure,
    String? bloodType,
    String? rh,
    String? sleep,
    String? water,
    String? smoking,
    String? alcohol,
    String? activity,
    String? conditions,
    String? allergies,
    String? notes,
  }) {
    return HealthState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      oxygen: oxygen ?? this.oxygen,
      heartRate: heartRate ?? this.heartRate,
      systolic: systolic ?? this.systolic,
      diastolic: diastolic ?? this.diastolic,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      bloodType: bloodType ?? this.bloodType,
      rh: rh ?? this.rh,
      sleep: sleep ?? this.sleep,
      water: water ?? this.water,
      smoking: smoking ?? this.smoking,
      alcohol: alcohol ?? this.alcohol,
      activity: activity ?? this.activity,
      conditions: conditions ?? this.conditions,
      allergies: allergies ?? this.allergies,
      notes: notes ?? this.notes,
    );
  }

  // تحويل الـ state لـ model عشان نبعته للـ repository
  HealthMetricModel toModel() => HealthMetricModel(
    body: BodyParametersModel(
      height: double.tryParse(height),
      weight: double.tryParse(weight),
      oxygen: int.tryParse(oxygen),
      heartRate: int.tryParse(heartRate),
      bloodPressure: int.tryParse(bloodPressure),
      systolic: int.tryParse(systolic),
      diastolic: int.tryParse(diastolic),
      bloodType: bloodType,
      rh: rh,
    ),
    lifestyle: LifestyleModel(
      sleep: sleep,
      water: water,
      smoking: smoking,
      alcohol: alcohol,
      activity: activity,
    ),
    anamnesis: AnamnesisModel(conditions: conditions, allergies: allergies),
    notes: notes,
  );

  // تحويل الـ model (يلي جاي من التخزين) لـ state
  factory HealthState.fromModel(HealthMetricModel model) => HealthState(
    height: model.body.height?.toString() ?? '',
    weight: model.body.weight?.toString() ?? '',
    oxygen: model.body.oxygen?.toString() ?? '',
    heartRate: model.body.heartRate?.toString() ?? '',
    bloodPressure: model.body.bloodPressure?.toString() ?? '',
    systolic: model.body.systolic?.toString() ?? '',
    diastolic: model.body.diastolic?.toString() ?? '',
    bloodType: model.body.bloodType ?? 'B',
    rh: model.body.rh ?? '+',
    sleep: model.lifestyle.sleep ?? '',
    water: model.lifestyle.water ?? '',
    smoking: model.lifestyle.smoking ?? '',
    alcohol: model.lifestyle.alcohol ?? '',
    activity: model.lifestyle.activity ?? '',
    conditions: model.anamnesis.conditions ?? '',
    allergies: model.anamnesis.allergies ?? '',
    notes: model.notes ?? '',
  );
}