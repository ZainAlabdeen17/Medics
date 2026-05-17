// health_state.dart
import 'package:medics/features/medical_records/data/health_metric_model.dart';

abstract class HealthState {}

class HealthInitial extends HealthState {}

class HealthLoading extends HealthState {}

class HealthLoaded extends HealthState {
  final HealthMetricModel model;
  HealthLoaded(this.model);
}

class HealthError extends HealthState {
  final String message;
  HealthError(this.message);
}