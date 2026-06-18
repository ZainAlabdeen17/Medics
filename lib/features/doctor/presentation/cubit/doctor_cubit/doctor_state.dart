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
