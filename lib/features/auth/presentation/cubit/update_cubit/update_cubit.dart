import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/auth/presentation/cubit/update_cubit/update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateState());
  void toggleObscurePassword() {
    emit(UpdateState(obSecurePassword: !state.obSecurePassword));
  }
}
