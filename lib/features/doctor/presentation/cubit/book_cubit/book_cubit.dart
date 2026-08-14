import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/doctor/data/models/day_models.dart';
import 'package:medics/features/doctor/data/repository/booking_repositry.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_state.dart';

class BookCubit extends Cubit<BookState> {
  final BookingRepositry repo;

  BookCubit(this.repo) : super(BookState());

  void getDays({required String doctorId}) async {
    emit(
      state.copyWith(
        isLoadingDays: true,
        daysErrorMessage: null,
        bookingErrorMessage: null,
      ),
    );
    final result = await repo.getBookingDays(doctorId);
    if (isClosed) return;
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoadingDays: false,
            daysErrorMessage: failure.message,
          ),
        );
      },
      (days) {
        emit(state.copyWith(isLoadingDays: false, days: days));
      },
    );
  }

  void toggleDaySelection(DayModel day, String doctorId) async {
    if (state.selectedDay?.fullDate != day.fullDate) {
      emit(
        state.copyWith(
          selectedDay: day,
          resetTime: true,
          isLoadingTimes: true,
          availableTimes: [],
          timesErrorMessage: null,
          bookingErrorMessage: null,
        ),
      );

      final result = await repo.getBookingTimes(doctorId, day.fullDate);
      if (isClosed) return;
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoadingTimes: false,
              timesErrorMessage: failure.message,
            ),
          );
        },
        (times) {
          emit(
            state.copyWith(
              isLoadingTimes: false,
              availableTimes: times,
              timesErrorMessage: null,
            ),
          );
        },
      );
    }
  }

  void bookAppointment({required String doctorId}) async {
    if (state.selectedDay != null &&
        state.selectedTime.isNotEmpty &&
        state.reason.trim().isNotEmpty) {
      emit(
        state.copyWith(
          isBookingLoading: true,
          bookingErrorMessage: null,
          successAppointmentData: null,
        ),
      );
      final result = await repo.bookAppointment(
        doctorId: doctorId,
        date: state.selectedDay!.fullDate,
        time: state.selectedTime,
        reason: state.reason,
      );
      if (isClosed) return;
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isBookingLoading: false,
              bookingErrorMessage: failure.message,
            ),
          );
        },
        (appoinment) {
          emit(
            state.copyWith(
              isBookingLoading: false,
              successAppointmentData: appoinment,
            ),
          );
        },
      );
    }
  }

  void rescheduleAppointment({required String appointmentId}) async {
    if (state.selectedDay != null &&
        state.selectedTime.isNotEmpty &&
        state.reason.trim().isNotEmpty) {
      emit(
        state.copyWith(
          isBookingLoading: true,
          bookingErrorMessage: null,
          successAppointmentData: null,
        ),
      );
      final result = await repo.rescheduleAppointment(
        appointmentId: appointmentId,
        date: state.selectedDay!.fullDate,
        time: state.selectedTime,
      );
      if (isClosed) return;
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isBookingLoading: false,
              bookingErrorMessage: failure.message,
            ),
          );
        },
        (appoinment) {
          emit(
            state.copyWith(
              isBookingLoading: false,
              successAppointmentData: appoinment,
            ),
          );
        },
      );
    }
  }

  bool isReadyToBook() {
    return state.selectedDay != null &&
        state.selectedTime.isNotEmpty &&
        state.reason.trim().isNotEmpty;
  }

  bool isDaySelected(DayModel day) =>
      state.selectedDay?.fullDate == day.fullDate;

  void toggleTimeSelection(String time) =>
      emit(state.copyWith(bookingErrorMessage: null, selectedTime: time));

  bool isTimeSelected(String time) => state.selectedTime == time;

  void updateReason(String reason) =>
      emit(state.copyWith(reason: reason, bookingErrorMessage: null));

  void resetBookingStatus() {
    emit(state.copyWith(successAppointmentData: null));
  }
}
