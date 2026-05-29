import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/core/validation/app_validator.dart';
import 'package:medics/core/validation/password_validator.dart';
import 'package:medics/features/auth/presentation/cubit/validation_cubit/validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(ValidationState());
  void onFirstNameChanged(String firstName) {
    emit(
      state.copyWith(
        firstName: firstName,
        firstNameError: AppValidator.nameValidator(firstName),
      ),
    );
  }

  void onLastNameChanged(String lastName) {
    emit(
      state.copyWith(
        lastName: lastName,
        lastNameError: AppValidator.nameValidator(lastName),
      ),
    );
  }

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
}
