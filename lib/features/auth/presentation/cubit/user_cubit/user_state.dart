abstract class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {}

final class UserFailure extends UserState {
  final String errorMessage;

  UserFailure(this.errorMessage);
}

final class ObscurePasswordState extends UserState {
  final bool isObscure;

  ObscurePasswordState(this.isObscure);
}
