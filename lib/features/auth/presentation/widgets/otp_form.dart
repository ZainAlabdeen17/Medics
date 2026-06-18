import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_state.dart';
import 'package:pinput/pinput.dart';
// import 'package:vibration/vibration.dart';
// import 'package:vibration/vibration.dart';

// ignore: must_be_immutable
class OtpForm extends StatelessWidget {
  final String email;
  const OtpForm({super.key, required this.email});
  PinTheme pinTheme({required Color borderColor, required Color fillColor}) {
    return PinTheme(
      height: 60.h,
      width: 60.w,
      textStyle: AppTextStyles.head2.copyWith(color: AppColors.textPrimary),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: borderColor, width: 1.w),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) async {
        if (state is VerifySuccessState) {
          if (state.isProfileCompleted) {
            context.pushReplacement("/Home");
          } else {
            context.pushReplacement("/Patient");
          }
        }
        if (state is VerifyFailureState) {
          // await triggerErrorHaptic();
          userCubit.otpCodeController.clear();
        }
      },
      builder: (context, state) {
        return Pinput(
          controller: userCubit.otpCodeController,
          defaultPinTheme: pinTheme(
            borderColor: AppColors.borderBlack,
            fillColor: AppColors.surfaceBlur,
          ),
          focusedPinTheme: pinTheme(
            borderColor: AppColors.borderAccent,
            fillColor: Colors.transparent,
          ),
          submittedPinTheme: pinTheme(
            borderColor: AppColors.borderAccent,
            fillColor: Colors.transparent,
          ),
          errorPinTheme: pinTheme(
            borderColor: AppColors.borderRed,
            fillColor: Colors.transparent,
          ),
          forceErrorState: state is VerifyFailureState,
          errorText: state is VerifyFailureState ? state.errorMessage : null,
          errorTextStyle: AppTextStyles.body2.copyWith(
            color: AppColors.textRed,
          ),
          enabled: state is! VerifyLoadingState,
          pinAnimationType: PinAnimationType.scale,
          animationDuration: Duration(milliseconds: 300),
          keyboardType: TextInputType.number,
          animationCurve: Curves.bounceIn,

          closeKeyboardWhenCompleted: true,
          length: 6,
          onCompleted: (value) {
            userCubit.verify(email: email, code: value);
          },
        );
      },
    );
  }
}

// //border color , fill color
// Future<void> triggerErrorHaptic() async {
//   if (await Vibration.hasVibrator()) {
//     Vibration.vibrate(duration: 200); // مللي ثانية
//   }
// }
