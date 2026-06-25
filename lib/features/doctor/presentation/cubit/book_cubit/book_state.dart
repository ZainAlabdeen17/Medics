import 'package:medics/features/doctor/data/models/day_models.dart';

class BookState {
  final DayModel? selectedDay;
  final String selectedTime;

  BookState({this.selectedDay=const DayModel(fullDate: '', dayName: '', dayNumber: '', monthName: ''), this.selectedTime = ""});
  BookState copyWith({DayModel? selectedDay, String? selectedTime}) {
    return BookState(
      selectedDay: selectedDay ?? this.selectedDay,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}
