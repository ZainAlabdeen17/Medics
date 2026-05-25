import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.errorText,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.hasError = false,
    this.validator,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.autoFocus = false,
    this.keyboardType,
    this.maxLines = 1,
    this.isBigFeild = false,
  });
  final String hintText;
  final TextEditingController? controller;
  final String? errorText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool hasError;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool autoFocus;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool isBigFeild;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        //

        //
        validator: validator ?? (value) => null,
        //
        onChanged: onChanged,
        //
        onTap: onTap,
        //
        obscureText: obscureText,
        obscuringCharacter: '*',
        //
        cursorColor: AppColors.textStaticBlack,
        cursorHeight: 20.h,
        //
        style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
        //
        readOnly: readOnly,
        //
        autofocus: autoFocus,
        //
        decoration: InputDecoration(
          //
          hintText: hintText,
          hintStyle: AppTextStyles.body1.copyWith(
            color: AppColors.textSecondary,
          ),
          //
          errorText: errorText,
          errorStyle: AppTextStyles.body3.copyWith(color: AppColors.textRed),
          //
          filled: true,
          fillColor: AppColors.surfaceBlur,
          //
          suffixIcon: suffixIcon,
          //
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(
            minWidth: 48.w,
            minHeight: 24.h,
          ),
          //
          prefixIconColor: AppColors.iconGrey,
          //
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          //
          border: customOutlineInputBorder(
            hasError ? AppColors.borderRed : AppColors.borderBlack,
            isBigFeild: isBigFeild,
          ),
          //
          focusedBorder: customOutlineInputBorder(
            hasError ? AppColors.borderRed : AppColors.borderBlack,
            isBigFeild: isBigFeild,
          ),
          //
          enabledBorder: customOutlineInputBorder(
            hasError ? AppColors.borderRed : AppColors.borderBlack,
            isBigFeild: isBigFeild,
          ),
          //
          errorBorder: customOutlineInputBorder(
            AppColors.borderRed,
            isBigFeild: isBigFeild,
          ),
          //
          focusedErrorBorder: customOutlineInputBorder(
            AppColors.borderRed,
            isBigFeild: isBigFeild,
          ),
          //
        ),
      ),
    );
  }
}

OutlineInputBorder customOutlineInputBorder(
  Color borderColor, {
  bool isBigFeild = false,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(isBigFeild ? 24.r : 100.r),
    borderSide: BorderSide(color: borderColor, width: 1.w),
  );
}
