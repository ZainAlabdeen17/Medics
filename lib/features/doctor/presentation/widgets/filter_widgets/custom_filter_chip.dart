import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.width,
  });
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24.r),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.center,
            height: 48.h,
            // width: width ?? 106.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: isSelected
                    ? AppColors.borderAccent
                    : AppColors.borderBlack,
                width: 1.w,
              ),
              color: isSelected
                  ? AppColors.surfaceAccent
                  : AppColors.surfaceBlur,
            ),
            child: Text(
              title,
              style: AppTextStyles.body1.copyWith(
                color: isSelected
                    ? AppColors.textStaticWhite
                    : AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
