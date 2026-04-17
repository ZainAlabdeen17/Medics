import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';

class TextFieldCity extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap; 
  const TextFieldCity({super.key, required this.hintText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.borderBlack,
        suffixIcon: Icon(
          Icons.keyboard_arrow_down,
          size: 24.sp,
          color: AppColors.textPrimary,
        ),

        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.r),
          borderSide: BorderSide(color: AppColors.borderBlack, width: 1.w),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.r),
          borderSide: BorderSide(color: AppColors.borderBlack, width: 1.w),
        ),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.r)),
      ),
    );
  }
}
