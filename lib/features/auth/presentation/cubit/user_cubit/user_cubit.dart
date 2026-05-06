import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(super.initialState);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObSecure = true;

  void toggleObscurePassword() {
    isObSecure = !isObSecure;
    emit(ObscurePasswordState(!isObSecure));
  }

  void signIn() {
    try {
      emit(UserLoading());
      Future.delayed(Duration(seconds: 4), () {
        if (kDebugMode) {
          print("💫💫💫💫💫💫💫💫💫💫");
          print(
            'Email: ${emailController.text}, Password: ${passwordController.text}',
          );
          print("💫💫💫💫💫💫💫💫💫💫");
        }
      });
      emit(UserSuccess());
    } on Exception catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
}
