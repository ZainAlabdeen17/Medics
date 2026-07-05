import 'package:flutter/material.dart';
import 'package:medics/features/doctor/data/models/day_models.dart';

@immutable
sealed class DoctorDetailsState {}

final class DoctorDetailsInitial extends DoctorDetailsState {}

final class GetDaysLoading extends DoctorDetailsState {}

final class GetDaysSuccess extends DoctorDetailsState {
  final List<DayModel> days;

  GetDaysSuccess({required this.days});
}

final class GetDaysFailure extends DoctorDetailsState {
  final String errorMessage;

  GetDaysFailure({required this.errorMessage});
}
