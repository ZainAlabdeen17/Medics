import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/core/validation/app_validator.dart';
import 'package:medics/core/validation/password_validator.dart';
import 'package:medics/features/auth/presentation/cubit/validation_cubit/auth_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(ValidationState());
  String? signInemail;
  String? signInPassword;
  void onEmailChanged(String email) {
    emit(
      state.copyWith(
        email: email,
        emailError: AppValidator.validateEmail(email),
      ),
    );
  }

  void onPasswordChanged(String password) {
    final passwordValidator = PasswordValidator(
      hasMinLength: password.length >= 8,
      hasUppercase: RegExp(r'[A-Z]').hasMatch(password),
      hasTwoNumbers: RegExp(r'\d').allMatches(password).length >= 2,
    );
    emit(
      state.copyWith(password: password, passwordValidator: passwordValidator),
    );
  }

  void onEmailChangeForSignIn(String? email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChangeForSignIn(String? password) {
    emit(state.copyWith(password: password));
  }
}
