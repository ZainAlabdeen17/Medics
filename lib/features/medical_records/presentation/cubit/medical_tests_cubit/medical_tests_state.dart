import 'package:medics/features/medical_records/data/models/medical_test_model.dart';

abstract class MedicalTestsState {}

class MedicalTestsInitial extends MedicalTestsState {}

class MedicalTestsLoading extends MedicalTestsState {}

class MedicalTestsSuccess extends MedicalTestsState {
  final List<MedicalTestModel> medicalTests;
  MedicalTestsSuccess(this.medicalTests);
}

class MedicalTestsError extends MedicalTestsState {
  final String message;
  MedicalTestsError({required this.message});
}
