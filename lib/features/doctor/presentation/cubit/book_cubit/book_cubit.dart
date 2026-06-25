   import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/doctor/data/models/day_models.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookState());
  void toggleDaySelection(DayModel day) {
    if (!(day.monthName == state.selectedDay!.monthName &&
        day.dayNumber == state.selectedDay!.dayNumber &&
        day.dayName == state.selectedDay!.dayName)) {
      emit(state.copyWith(selectedDay: day));
    }
  }

  bool isDaySelected(DayModel day) {
    if (day.monthName == state.selectedDay!.monthName &&
        day.dayNumber == state.selectedDay!.dayNumber &&
        day.dayName == state.selectedDay!.dayName) {
      return true;
    } else {
      return false;
    }
  }

  void toggleTimeSelection(String time) {
    if (state.selectedTime != time) {
      emit(state.copyWith(selectedTime: time));
    }
  }

  bool isTimeSelected(String time) {
    return state.selectedTime == time;
  }


}
