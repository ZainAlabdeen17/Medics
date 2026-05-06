import 'package:medics/core/validation/password_validator.dart';

enum AuthStatus { initial, loading, success, failure }

const _empty = Object();

class ValidationState {
  final String email;
  final String password;
  final Object? emailError;
  final PasswordValidator? passwordValidator;
  final AuthStatus status;
  final Object? errorMessage;

  ValidationState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordValidator = const PasswordValidator(),
    this.status = AuthStatus.initial,
    this.errorMessage,
  });
  bool get isFormValid =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      emailError == null &&
      passwordValidator != null &&
      passwordValidator!.isValid;
  ValidationState copyWith({
    String? email,
    String? password,
    Object? emailError = _empty,
    PasswordValidator? passwordValidator,
    AuthStatus? status,
    Object? errorMessage = _empty,
  }) {
    return ValidationState(
      email: email ?? this.email,
      password: password ?? this.password,
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
