import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/doctor/data/repository/doctor_repository.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final DoctorRepository repo;

  DoctorCubit(this.repo) : super(DoctorInitial());

  Future<void> getDoctors({
    String? searchQuery,
    List<String>? specializations,
    String? experience,
    String? gender,
  }) async {
    emit(DoctorLoading());
    final result = await repo.getDoctors(
      searchQuery: searchQuery,
      specializations: specializations,
      experience: experience,
      gender: gender,
    );
    result.fold(
      (failure) {
        emit(DoctorFailure(errorMessage: failure.message));
      },
      (doctors) {
        emit(DoctorSuccess(doctors: doctors));
      },
    );
  }
  void getDays({required String doctorId})async {
    emit(GetDaysLoading());
    final result = await repo.getBookingDays(doctorId);
    result.fold(
      (failure) {
        emit(GetDaysFailure(errorMessage: failure.message));
      },
      (days) {
        emit(GetDaysSuccess(days: days));
      },
    );
  }
}
