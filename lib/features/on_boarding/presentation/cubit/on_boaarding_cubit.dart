import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/on_boarding/presentation/cubit/on_boarding_state.dart';

class OnBoaardingCubit extends Cubit<OnBoardingState> {
  OnBoaardingCubit() : super(NextButtonState());
  void getButtons({required int index}) {
    if (index == 0) {
      emit(NextButtonState());
    } else if (index == 1) {
      emit(GetStartedButtonState());
    } else if (index == 2) {
      emit(AuthButtonState());
    }
  }
}
