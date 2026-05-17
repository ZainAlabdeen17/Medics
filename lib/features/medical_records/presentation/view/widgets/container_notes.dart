import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class ContainerNotes extends StatelessWidget {
  final String text;
  const ContainerNotes({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.borderBlack,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Text(
          text,
          style: AppTextStyles.body1.copyWith(
            color: AppColors.textPrimary,
          ),
            
          
        ),
      ),
    );
  }
}
