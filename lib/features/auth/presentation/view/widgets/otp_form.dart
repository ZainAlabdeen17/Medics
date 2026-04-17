import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});
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
    return Pinput(
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
      length: 5,
      onCompleted: (value) {},
    );
  }
}
//border color , fill color