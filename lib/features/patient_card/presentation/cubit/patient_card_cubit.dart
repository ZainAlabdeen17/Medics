// patient_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
part 'patient_card_state.dart';

class PatientCardCubit extends Cubit<PatientCardState> {
  PatientCardCubit() : super(PatientCardState());

  // ============ Personal Data ============
  void updateFirstName(String value) =>
      emit(state.copyWith(firstName: value));

  void updateLastName(String value) =>
      emit(state.copyWith(lastName: value));

  void updateDateOfBirth(String value) =>
      emit(state.copyWith(dateOfBirth: value));

  void updatePhoneNumber(String value) =>
      emit(state.copyWith(phoneNumber: value));

  void updateCity(String value) =>
      emit(state.copyWith(city: value));

  // ============ Emergency Contact ============
  void updateEmergencyFirstName(String value) =>
      emit(state.copyWith(emergencyFirstName: value));

  void updateRelationship(String value) =>
      emit(state.copyWith(relationship: value));

  // ============ Health Assessment ============
  void updateBloodType(String value) =>
      emit(state.copyWith(bloodType: value));

  void updateRh(String value) =>
      emit(state.copyWith(rhType: value));

  void updateAllergies(String value) =>
      emit(state.copyWith(allergies: value));

  void updateHeight(String value) =>
      emit(state.copyWith(height: value));

  void updateWeight(String value) =>
      emit(state.copyWith(weight: value));

  void updateBloodPressure(String systolic, String diastolic) =>
      emit(state.copyWith(
        systolicPressure: systolic,
        diastolicPressure: diastolic,
      ));

  // ============ Lifestyle ============
  void updateSmoking(String value) =>
      emit(state.copyWith(smoking: value));

  void updateAlcohol(String value) =>
      emit(state.copyWith(alcohol: value));

  void updateActivityLevel(String value) =>
      emit(state.copyWith(activityLevel: value));

  // ============ Submit ============
  void submitAll() {
  }
  void pp(){
    
  }
}