import 'package:flutter/material.dart';
import 'package:medics/features/specialization/data/models/specialization_model.dart';

@immutable
sealed class SpecializationState {}

final class SpecializationInitial extends SpecializationState {}

final class SpecializationLoading extends SpecializationState {}

final class SpecializationSuccess extends SpecializationState {
  final List<SpecializationModel> specializations;
  SpecializationSuccess({required this.specializations});
}

final class SpecializationFailure extends SpecializationState {
  final String errorMessage;
  SpecializationFailure({required this.errorMessage});
}
