import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class GenaralChip extends StatelessWidget {
  final String title;
  const GenaralChip({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      height: 32.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: AppColors.borderBlack),
        color: AppColors.surfaceCard,
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextStyles.body1.copyWith(
            color: AppColors.textSecondary,
            fontFamily: "Inter",
          ),
        ),
      ),
    );
  }
}
