import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/core/functions/auth_and_connect_socket.dart';
import 'package:medics/features/auth/data/repositories/auth_repository.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.authRepository) : super(UserInitial());
  final AuthRepository authRepository;
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
  final TextEditingController otpCodeController = TextEditingController();

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
    result.fold((failure) => emit(SignInFailureState(failure.message)), (
      authSession,
    ) {
      emit(
        SignInSuccessState(
          isProfileCompleted: authSession.user.isProfileCompleted,
        ),
      );
      checkAuthAndConnectSocket();
    });
  }

  Future<void> signUp() async {
    emit(SignUpLoadingState());
    final result = await authRepository.register(
      email: signUpEmailController.text,
      password: signUpPasswordController.text,
      firstName: signUpFirstNameController.text,
      lastName: signUpLastNameController.text,
    );
    result.fold(
      (failure) => emit(SignUpFailureState(failure.message)),
      (user) => emit(SignUpSuccessState(email: user.email)),
    );
  }

  Future<void> verify({required String email, required String code}) async {
    emit(VerifyLoadingState());
    final result = await authRepository.verifyEmail(email: email, code: code);
    result.fold((failure) => emit(VerifyFailureState(failure.message)), (
      authSession,
    ) {
      emit(
        VerifySuccessState(
          isProfileCompleted: authSession.user.isProfileCompleted,
        ),
      );
      checkAuthAndConnectSocket();
    });
  }

  @override
  Future<void> close() {
    signInEmailController.dispose();
    signInPasswordController.dispose();
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpFirstNameController.dispose();
    signUpLastNameController.dispose();
    return super.close();
  }
}
