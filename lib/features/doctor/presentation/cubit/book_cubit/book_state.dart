import 'package:medics/features/appointments/data/models/appointment_model.dart';
import 'package:medics/features/doctor/data/models/day_models.dart';

const Object _empty = Object();

class BookState {
  final bool isLoadingDays;
  final List<DayModel> days;
  final String? daysErrorMessage;

  final DayModel? selectedDay;
  final String selectedTime;
  final List<String> availableTimes;
  final bool isLoadingTimes;
  final String? timesErrorMessage;

  final String reason;

  final bool isBookingLoading;
  final String? bookingErrorMessage;
  final AppointmentModel? successAppointmentData;

  BookState({
    this.isLoadingDays = false,
    this.days = const [],
    this.daysErrorMessage,
    this.selectedDay,
    this.selectedTime = "",
    this.availableTimes = const [],
    this.isLoadingTimes = false,
    this.timesErrorMessage,
    this.reason = "",
    this.isBookingLoading = false,
    this.bookingErrorMessage,
    this.successAppointmentData,
  });

  BookState copyWith({
    bool? isLoadingDays,
    List<DayModel>? days,
    Object? daysErrorMessage = _empty,
    DayModel? selectedDay,
    String? selectedTime,
    List<String>? availableTimes,
    bool? isLoadingTimes,
    Object? timesErrorMessage = _empty,
    bool resetTime = false,
    String? reason,
    bool? isBookingLoading,
    Object? bookingErrorMessage = _empty,
    AppointmentModel? successAppointmentData,
  }) {
    return BookState(
      isLoadingDays: isLoadingDays ?? this.isLoadingDays,
      days: days ?? this.days,

      daysErrorMessage: daysErrorMessage == _empty
          ? this.daysErrorMessage
          : (daysErrorMessage as String?),

      selectedDay: selectedDay ?? this.selectedDay,
      selectedTime: resetTime ? "" : (selectedTime ?? this.selectedTime),
      availableTimes: availableTimes ?? this.availableTimes,
      isLoadingTimes: isLoadingTimes ?? this.isLoadingTimes,

      timesErrorMessage: timesErrorMessage == _empty
          ? this.timesErrorMessage
          : (timesErrorMessage as String?),
      reason: reason ?? this.reason,
      isBookingLoading: isBookingLoading ?? this.isBookingLoading,
      bookingErrorMessage: bookingErrorMessage == _empty
          ? this.bookingErrorMessage
          : (bookingErrorMessage as String?),
      successAppointmentData:
          successAppointmentData ?? this.successAppointmentData,
    );
  }
}
