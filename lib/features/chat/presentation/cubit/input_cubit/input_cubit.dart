import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/chat/presentation/cubit/input_cubit/input_state.dart';

class InputCubit extends Cubit<InputState> {
  InputCubit() : super(InputState());
  void updateInput(String? input) {
    emit(state.copyWith(input: input));
  }
}
