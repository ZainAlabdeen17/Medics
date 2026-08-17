import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/appointments/data/models/appointment_model.dart';
import 'package:medics/features/appointments/data/repositories/appointment_repository.dart';
import 'package:medics/features/appointments/presentation/cubit/appointment_cubit/appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepository appointmentRepository;
  AppointmentCubit(this.appointmentRepository) : super(AppointmentInitial());
  int currentPage = 1;
  bool hasMoreData = true;
  bool isLoadingMore = false;
  List<AppointmentModel> allAppointments = [];
  Future<void> getAppointments() async {
    currentPage = 1;
    hasMoreData = true;
    isLoadingMore = false;
    allAppointments.clear();
    if (!isClosed) {
      emit(AppointmentsLoading());
    }
    final result = await appointmentRepository.getAppointments(
      page: currentPage,
    );
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(AppointmentsFailure(errorMessage: failure.message));
        }
      },
      (appointments) {
        allAppointments = appointments;
        if (allAppointments.length < 8) {
          hasMoreData = false;
        }
        if (!isClosed) {
          emit(AppointmentsSuccess(appointments: List.from(allAppointments)));
        }
      },
    );
  }

  void getNextPage() async {
    if (isLoadingMore || !hasMoreData) return;
    isLoadingMore = true;
    if (!isClosed) {
      emit(AppointmentsSuccess(appointments: List.from(allAppointments)));
    }
    currentPage++;
    final result = await appointmentRepository.getAppointments(
      page: currentPage,
    );
    result.fold(
      (failure) {
        isLoadingMore = false;
        currentPage--;
        if (!isClosed) {
          emit(AppointmentsSuccess(appointments: List.from(allAppointments)));
        }
      },
      (newAppointments) {
        isLoadingMore = false;

        if (newAppointments.isEmpty || newAppointments.length < 8) {
          hasMoreData = false;
        }

        if (newAppointments.isNotEmpty) {
          allAppointments.addAll(newAppointments);
          if (!isClosed) {
            emit(AppointmentsSuccess(appointments: List.from(allAppointments)));
          }
        }
      },
    );
  }

  void cancelAppointment({
    required String appointmentId,
    required String reason,
  }) async {
    if (!isClosed) {
      emit(AppointmentActionLoading());
    }
    final result = await appointmentRepository.cancelAppointment(
      appointmentId: appointmentId,
      reason: reason,
    );
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(AppointmentActionFailure(failure.message));
        }
      },
      (message) {
        if (!isClosed) {
          emit(AppointmentCancelSuccess(message));
        }
      },
    );
  }
}
