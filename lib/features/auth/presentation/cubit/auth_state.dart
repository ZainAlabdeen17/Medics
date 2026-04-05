import 'package:medics/core/validation/password_validator.dart';

enum AuthStatus { initial, loading, success, failure }

const _empty = Object();

class AuthState {
  final String email;
  final String password;
  final Object? emailError;
  final PasswordValidator? passwordValidator;
  final AuthStatus status;
  final Object? errorMessage;
  final bool obscurePassword;

  AuthState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordValidator = const PasswordValidator(),
    this.status = AuthStatus.initial,
    this.errorMessage,
    this.obscurePassword = true,
  });
  bool get isFormValid =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      emailError == null &&
      passwordValidator != null &&
      passwordValidator!.isValid;
  AuthState copyWith({
    String? email,
    String? password,
    Object? emailError = _empty,
    PasswordValidator? passwordValidator,
    AuthStatus? status,
    Object? errorMessage = _empty,
    bool? obscurePassword,
  }) {
    return AuthState(
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
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }
}
