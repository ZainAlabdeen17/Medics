import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/auth/data/repositories/auth_repository.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.authRepository) : super(UserInitial());
  final AuthRepository authRepository ;
  final TextEditingController signInEmailController = TextEditingController();
  final TextEditingController signInPasswordController =
      TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController signUpFirstNameController =
      TextEditingController();
  final TextEditingController signUpLastNameController =
      TextEditingController();

  bool isObSecure = true;

  void toggleObscurePassword() {
    isObSecure = !isObSecure;
    emit(ObscurePasswordState(isObSecure));
  }

  Future<void> signIn() async {
    emit(SignInLoadingState());
    final result = await authRepository.login(
      email: signInEmailController.text,
      password: signInPasswordController.text,
    );
    result.fold(
      (failure) => emit(SignInFailureState(failure.message)),
      (authSession) => emit(SignInSuccessState()),
    );
  }

  Future<void> signUp() async {
    try {
      emit(SignUpLoadingState());
      await Future.delayed(Duration(seconds: 7), () {
        if (kDebugMode) {
          print("🌵🌵🌵🌵🌵🌵🌵🌵🌵🌵");
          print(
            'First Name: ${signUpFirstNameController.text}, Last Name: ${signUpLastNameController.text}',
          );
          print(
            'Email: ${signUpEmailController.text}, Password: ${signUpPasswordController.text}',
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
