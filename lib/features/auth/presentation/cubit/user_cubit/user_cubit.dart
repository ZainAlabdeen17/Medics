import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObSecure = true;

  void toggleObscurePassword() {
    isObSecure = !isObSecure;
    emit(ObscurePasswordState(isObSecure));
  }

  Future<void> signIn() async {
    try {
      emit(SignInLoadingState());
      await Future.delayed(Duration(seconds: 7), () {
        if (kDebugMode) {
          print("🌵🌵🌵🌵🌵🌵🌵🌵🌵🌵");
          print(
            'Email: ${emailController.text}, Password: ${passwordController.text}',
          );
          print("🌵🌵🌵🌵🌵🌵🌵🌵🌵🌵");
        }
      });
      emit(SignInSuccessState());
    } on Exception catch (e) {
      emit(SignInFailureState(e.toString()));
    }
  }

  Future<void> signUp() async {
    try {
      emit(SignUpLoadingState());
      await Future.delayed(Duration(seconds: 7), () {
        if (kDebugMode) {
          print("🌵🌵🌵🌵🌵🌵🌵🌵🌵🌵");
          print(
            'Email: ${emailController.text}, Password: ${passwordController.text}',
          );
          print("🌵🌵🌵🌵🌵🌵🌵🌵🌵🌵");
        }
      });
      emit(SignUpSuccessState());
    } on Exception catch (e) {
      emit(SignUpFailureState(e.toString()));
    }
  }
}
