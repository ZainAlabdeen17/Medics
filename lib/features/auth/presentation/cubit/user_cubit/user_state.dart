abstract class UserState {}

final class UserInitial extends UserState {}

final class SignInLoadingState extends UserState {}

final class SignInSuccessState extends UserState {
  final bool isProfileCompleted;

  SignInSuccessState({ required this.isProfileCompleted });
}

final class SignInFailureState extends UserState {
  final String errorMessage;

  SignInFailureState(this.errorMessage);
}

final class SignUpLoadingState extends UserState {}

final class SignUpSuccessState extends UserState {
  final String email;

  SignUpSuccessState({required this.email});
}

final class SignUpFailureState extends UserState {
  final String errorMessage;

  SignUpFailureState(this.errorMessage);
}

final class ObscurePasswordState extends UserState {
  final bool isObscure;

  ObscurePasswordState(this.isObscure);
}
final class VerifyLoadingState extends UserState {}
final class VerifySuccessState extends UserState {
  final bool isProfileCompleted;

  VerifySuccessState({required this.isProfileCompleted});
}
final class VerifyFailureState extends UserState {
  final String errorMessage;

  VerifyFailureState(this.errorMessage);
}