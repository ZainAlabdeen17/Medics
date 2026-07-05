// health_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/medical_records/data/repository/health_repository.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_state.dart';


class HealthCubit extends Cubit<HealthState> {
  final HealthRepository healthRepository;

  HealthCubit({required this.healthRepository}) : super(const HealthState());

  Future<void> loadInitial() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await healthRepository.getHealthData();

    result.fold(
      (failure) => emit(
        state.copyWith(isLoading: false, errorMessage: failure.message),
      ),
      (model) => emit(HealthState.fromModel(model).copyWith(isLoading: false)),
    );
  }

  // ============ Body Parameters ============
  void updateHeight(String value) => emit(state.copyWith(height: value));
  void updateWeight(String value) => emit(state.copyWith(weight: value));
  void updateOxygen(String value) => emit(state.copyWith(oxygen: value));
  void updateHeartRate(String value) => emit(state.copyWith(heartRate: value));
  void updateSystolic(String value) => emit(state.copyWith(systolic: value));
  void updateDiastolic(String value) => emit(state.copyWith(diastolic: value));
  void updateBloodType(String value) => emit(state.copyWith(bloodType: value));
  void updateRh(String value) => emit(state.copyWith(rh: value));

  // ============ Lifestyle ============
  void updateSleep(String value) => emit(state.copyWith(sleep: value));
  void updateWater(String value) => emit(state.copyWith(water: value));
  void updateSmoking(String value) => emit(state.copyWith(smoking: value));
  void updateAlcohol(String value) => emit(state.copyWith(alcohol: value));
  void updateActivity(String value) => emit(state.copyWith(activity: value));

  // ============ Anamnesis ============
  void updateConditions(String value) => emit(state.copyWith(conditions: value));
  void updateAllergies(String value) => emit(state.copyWith(allergies: value));

  // ============ Notes ============
  void updateNotes(String value) => emit(state.copyWith(notes: value));

  // ============ Save  ============
  Future<void> save() async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));
    final result = await healthRepository.saveHealthData(model: state.toModel());

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
          isSuccess: false,
        ),
      ),
      (_) => emit(state.copyWith(isLoading: false, isSuccess: true)),
    );
  }
}