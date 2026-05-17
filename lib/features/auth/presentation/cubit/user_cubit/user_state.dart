abstract class UserState {}

final class UserInitial extends UserState {}

final class SignInLoadingState extends UserState {}

final class SignInSuccessState extends UserState {}

final class SignInFailureState extends UserState {
  final String errorMessage;

  SignInFailureState(this.errorMessage);
}

final class SignUpLoadingState extends UserState {}

final class SignUpSuccessState extends UserState {}

final class SignUpFailureState extends UserState {
  final String errorMessage;

  SignUpFailureState(this.errorMessage);
}

final class ObscurePasswordState extends UserState {
  final bool isObscure;

  ObscurePasswordState(this.isObscure);
}
