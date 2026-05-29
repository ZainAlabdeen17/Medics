import 'package:medics/core/validation/password_validator.dart';

enum AuthStatus { initial, loading, success, failure }

const _empty = Object();

class ValidationState {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final Object? firstNameError;
  final Object? lastNameError;
  final Object? emailError;
  final PasswordValidator? passwordValidator;
  final AuthStatus status;
  final Object? errorMessage;

  ValidationState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.passwordValidator = const PasswordValidator(),
    this.status = AuthStatus.initial,
    this.errorMessage,
  });
  bool get isFormValid =>
      firstName.isNotEmpty &&
      lastName.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      firstNameError == null &&
      lastNameError == null &&
      emailError == null &&
      passwordValidator != null &&
      passwordValidator!.isValid;
  ValidationState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    Object? firstNameError = _empty,
    Object? lastNameError = _empty,
    Object? emailError = _empty,
    PasswordValidator? passwordValidator,
    AuthStatus? status,
    Object? errorMessage = _empty,
  }) {
    return ValidationState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      firstNameError: firstNameError == _empty
          ? this.firstNameError
          : firstNameError as String?,
      lastNameError: lastNameError == _empty
          ? this.lastNameError
          : lastNameError as String?,
      emailError: emailError == _empty
          ? this.emailError
          : emailError as String?,
      passwordValidator: passwordValidator ?? this.passwordValidator,
      status: status ?? this.status,
      errorMessage: errorMessage == _empty
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}
