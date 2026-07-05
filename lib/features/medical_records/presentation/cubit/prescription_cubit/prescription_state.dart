import 'package:flutter/material.dart';
import 'package:medics/features/medical_records/data/medication_model.dart';

@immutable
sealed class PrescriptionState {}

final class PrescriptionInitial extends PrescriptionState {}

final class PrescriptionLoading extends PrescriptionState {}

final class PrescriptionSuccess extends PrescriptionState {
  final List<PrescriptionModel> prescriptions;

  PrescriptionSuccess(this.prescriptions);
}

final class PrescriptionError extends PrescriptionState {
  final String message;

  PrescriptionError({required this.message});
}
