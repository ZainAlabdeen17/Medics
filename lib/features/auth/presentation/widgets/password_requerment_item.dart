import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class PasswordRequirementItem extends StatelessWidget {
  final bool isValid;
  final String text;

  const PasswordRequirementItem({
    super.key,
    required this.isValid,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
          width: 20.w,
          child: Icon(
            isValid ? Icons.check : CupertinoIcons.circle_filled,
            color: isValid ? AppColors.iconGreen : AppColors.iconGreyDisabled,
            size: isValid ? 17.sp : 12.sp,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          text,
          style: AppTextStyles.body2.copyWith(
            color: isValid ? AppColors.textGreen : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
