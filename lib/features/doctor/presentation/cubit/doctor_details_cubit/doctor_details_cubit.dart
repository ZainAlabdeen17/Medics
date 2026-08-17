import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/doctor/data/repository/booking_repositry.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_details_cubit/doctor_details_state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  final BookingRepositry repo;
  DoctorDetailsCubit(this.repo) : super(DoctorDetailsInitial());
  void getDays({required String doctorId}) async {
    emit(GetDaysLoading());
    final result = await repo.getBookingDays(doctorId);
    if(isClosed) return;
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
