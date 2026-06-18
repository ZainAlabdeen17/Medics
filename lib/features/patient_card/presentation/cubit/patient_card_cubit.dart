// patient_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/patient_card/data/repositories/patient_repository.dart';
part 'patient_card_state.dart';

class PatientCardCubit extends Cubit<PatientCardState> {
  final PatientRepository patientRepository;

  PatientCardCubit({required this.patientRepository})
    : super(const PatientCardState());

  // ============ Personal Data ============
  void updateFirstName(String value) => emit(state.copyWith(firstName: value));

  void updateLastName(String value) => emit(state.copyWith(lastName: value));

  void updateDateOfBirth(String value) =>
      emit(state.copyWith(dateOfBirth: value));

  void updatePhoneNumber(String value) =>
      emit(state.copyWith(phoneNumber: value));

  void updateCity(String value) => emit(state.copyWith(city: value));

  // ============ Emergency Contact ============
  void updateEmergencyFirstName(String value) =>
      emit(state.copyWith(emergencyFirstName: value));

  void updateEmergencyLastName(String value) =>
      emit(state.copyWith(emergencyLastName: value));

  void updateRelationship(String value) =>
      emit(state.copyWith(relationship: value));

  void updateEmergencyPhone(String value) =>
      emit(state.copyWith(emergencyPhone: value));
  void updateEmergencyEmail(String value) =>
      emit(state.copyWith(emergencyEmail: value));
  void updateEmergencyCity(String value) =>
      emit(state.copyWith(emergencyCity: value));

  // ============ Health Assessment ============
  void updateBloodType(String value) => emit(state.copyWith(bloodType: value));

  void updateRh(String value) => emit(state.copyWith(rhType: value));

  void updateAllergies(String value) => emit(state.copyWith(allergies: value));

  void updateChronicConditions(String value) =>
      emit(state.copyWith(chronicConditions: value));

  void updateHeight(String value) => emit(state.copyWith(height: value));

  void updateWeight(String value) => emit(state.copyWith(weight: value));

  void updateBloodPressureSystolic(String systolic) =>
      emit(state.copyWith(systolicPressure: systolic));

  void updateBloodPressureDiastolic(String diastolic) =>
      emit(state.copyWith(diastolicPressure: diastolic));

  // ============ Lifestyle ============
  void updateSmoking(String value) => emit(state.copyWith(smoking: value));

  void updateAlcohol(String value) => emit(state.copyWith(alcohol: value));

  void updateActivityLevel(String value) =>
      emit(state.copyWith(activityLevel: value));

  // ============ Submit ============
  Future<void> submitAll() async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));
    final result = await patientRepository.submitPatientCard(
      patientCardState: state,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
            isSuccess: false,
          ),
        );
      },
      (successMessage) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      },
    );
  }
}
