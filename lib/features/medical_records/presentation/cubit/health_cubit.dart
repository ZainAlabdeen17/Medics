import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/medical_records/data/health_metric_model.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_state.dart';

class HealthCubit extends Cubit<HealthState> {
  HealthCubit() : super(HealthInitial());

  void loadInitial() async {
    emit(HealthLoading());
    try {
      // Replace with actual async loading (e.g., from local DB or API)
      final data = await _fetchInitialData();
      emit(HealthLoaded(data));
    } catch (e) {
      emit(HealthError('Failed to load data: ${e.toString()}'));
    }
  }

  void updateBody(BodyParametersModel newBody) {
    _updateState((model) => model.copyWith(body: newBody));
  }

  void updateLifestyle(LifestyleModel lifestyle) {
    _updateState((model) => model.copyWith(lifestyle: lifestyle));
  }

  void updateAnamnesis(AnamnesisModel anamnesis) {
    _updateState((model) => model.copyWith(anamnesis: anamnesis));
  }

  void updateNotes(String notes) {
    _updateState((model) => model.copyWith(notes: notes));
  }

  // Helper to reduce duplication and handle state checks
  void _updateState(HealthMetricModel Function(HealthMetricModel) update) {
    if (state is! HealthLoaded) {
      // Optional: emit error or log
      addError(StateError('Cannot update when state is ${state.runtimeType}'));
      return;
    }
    final current = (state as HealthLoaded).model;
    emit(HealthLoaded(update(current)));
  }

  // Placeholder – replace with real data source
  Future<HealthMetricModel> _fetchInitialData() async {
    return HealthMetricModel.empty();
  }
}