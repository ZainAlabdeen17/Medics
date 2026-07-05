import 'package:flutter/material.dart';
import 'package:medics/features/appointments/data/models/appointment_model.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentsLoading extends AppointmentState {}

final class AppointmentsSuccess extends AppointmentState {
  final List<AppointmentModel> appointments;

  AppointmentsSuccess({required this.appointments});
}

final class AppointmentsFailure extends AppointmentState {
  final String errorMessage;

  AppointmentsFailure({required this.errorMessage});
}

class AppointmentActionLoading extends AppointmentState {}

class AppointmentCancelSuccess extends AppointmentState {
  final String message;
  AppointmentCancelSuccess(this.message);
}

class AppointmentRescheduleSuccess extends AppointmentState {
  final String message;
  AppointmentRescheduleSuccess(this.message);
}

class AppointmentActionFailure extends AppointmentState {
  final String errorMessage;
  AppointmentActionFailure(this.errorMessage);
}
