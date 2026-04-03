import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class ButtonClass {
  static Widget customFillButton({
    required String text,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.btnPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.head3.copyWith(color: AppColors.textStaticWhite),
        ),
      ),
    );
  }

  static Widget customNonFillButton({
    required String text,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.surfacePrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
            side: BorderSide(color: AppColors.borderAccent, width: 1.w),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.head3.copyWith(color: AppColors.textAccent),
        ),
      ),
    );
  }
}
