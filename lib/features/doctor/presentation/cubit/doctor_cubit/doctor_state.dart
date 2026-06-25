import 'package:medics/features/doctor/data/models/day_models.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';

sealed class DoctorState {}

final class DoctorInitial extends DoctorState {}

final class DoctorLoading extends DoctorState {}

final class DoctorSuccess extends DoctorState {
  final List<DoctorModel> doctors;

  DoctorSuccess({required this.doctors});
}

final class DoctorFailure extends DoctorState {
  final String errorMessage;

  DoctorFailure({required this.errorMessage});
}
final class GetDaysLoading extends DoctorState {}
final class GetDaysSuccess extends DoctorState {
  final List<DayModel> days;

  GetDaysSuccess({required this.days});
}
final class GetDaysFailure extends DoctorState {
  final String errorMessage;

  GetDaysFailure({required this.errorMessage});
}
