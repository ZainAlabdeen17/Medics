import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class TimeChip extends StatelessWidget {
  const TimeChip({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onTap,
  });

  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32.r),
      child: AnimatedContainer(
        duration: Duration(microseconds: 200),
        width: 74.w,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.borderAccent : AppColors.borderBlack,
            width: 1.w,
          ),
          color: isSelected ? AppColors.surfaceAccent : AppColors.surfaceBlur,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Center(
          child: Text(
            time,
            style: AppTextStyles.num2.copyWith(
              color: isSelected
                  ? AppColors.textStaticWhite
                  : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
