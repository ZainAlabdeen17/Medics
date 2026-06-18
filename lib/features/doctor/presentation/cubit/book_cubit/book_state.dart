import 'package:medics/features/doctor/data/models/book_day_model.dart';

class BookState {
  final BookDayModel? selectedDay;
  final String selectedTime;

  BookState({this.selectedDay = const BookDayModel(), this.selectedTime = ""});
  BookState copyWith({BookDayModel? selectedDay, String? selectedTime}) {
    return BookState(
      selectedDay: selectedDay ?? this.selectedDay,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}
