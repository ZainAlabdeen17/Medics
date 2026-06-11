import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class OtpForm extends StatelessWidget {
  final String email;
   TextEditingController otpController = TextEditingController();
   OtpForm({super.key, required this.email});
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
    return Pinput(
      controller: otpController,
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
      length: 6,
      onCompleted: (value) {
        userCubit.verify(email: email, code: value);
        otpController.clear();
      },
    );
  }
}
//border color , fill color