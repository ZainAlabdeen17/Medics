import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class ButtonClass {
  static Widget customFillButton({
    required String text,
    VoidCallback? onPressed,
    int width = 0,
    Widget? prefixIcon,
  }) {
    return SizedBox(
      width: width == 0 ? double.infinity : width.w,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.btnPrimary,
          disabledBackgroundColor: AppColors.btnDisabled,
          disabledForegroundColor: AppColors.textStaticWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
        child: _buildButtonChild(text, prefixIcon, true),
      ),
    );
  }

  static Widget customNonFillButton({
    required String text,
    VoidCallback? onPressed,
    int width = 0,
    Widget? prefixIcon,
  }) {
    return SizedBox(
      width: width == 0 ? double.infinity : width.w,
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
        child: _buildButtonChild(text, prefixIcon, false),
      ),
    );
  }

  static Widget _buildButtonChild(String text, Widget? prefixIcon, bool fill) {
    if (prefixIcon == null) {
      return Text(
        text,
        style: AppTextStyles.head3.copyWith(
          color: _getTextColorForFillButton(fill),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        prefixIcon,
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.head3.copyWith(
              color: _getTextColorForFillButton(fill),
              fontSize: 12.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  static Color _getTextColorForFillButton(bool fill) {
    return fill ? AppColors.textStaticWhite : AppColors.textAccent;
  }
}
