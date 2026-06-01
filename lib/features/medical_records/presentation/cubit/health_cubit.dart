import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medics/features/medical_records/data/health_metric_model.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_state.dart';

class HealthCubit extends Cubit<HealthState> {
  HealthCubit() : super(HealthInitial());

  static const String _key = 'health_data';

  void loadInitial() async {
    emit(HealthLoading());
    try {
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

  void _updateState(HealthMetricModel Function(HealthMetricModel) update) {
    if (state is! HealthLoaded) return;

    final current = (state as HealthLoaded).model;
    final newModel = update(current);

    emit(HealthLoaded(newModel));

    _saveData(newModel);
  }

  Future<HealthMetricModel> _fetchInitialData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);

    if (jsonString == null) return HealthMetricModel.empty();

    return HealthMetricModel.fromJson(jsonDecode(jsonString));
  }

  Future<void> _saveData(HealthMetricModel model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(model.toJson()));
  }
}
