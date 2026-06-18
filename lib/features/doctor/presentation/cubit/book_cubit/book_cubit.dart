import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/doctor/data/models/book_day_model.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookState());
  void toggleDaySelection(BookDayModel day) {
    if (!(day.month == state.selectedDay!.month &&
        day.day == state.selectedDay!.day &&
        day.weekDay == state.selectedDay!.weekDay)) {
      emit(state.copyWith(selectedDay: day));
    }
  }

  bool isDaySelected(BookDayModel day) {
    if (day.month == state.selectedDay!.month &&
        day.day == state.selectedDay!.day &&
        day.weekDay == state.selectedDay!.weekDay) {
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
