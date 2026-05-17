import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class MedicationCardItem extends StatelessWidget {
  const MedicationCardItem({
    super.key,
    required this.iconName,
    required this.title,
    required this.value,
  });

  final String iconName;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 24.w, height: 24.h, child: SvgPicture.asset(iconName)),
        SizedBox(width: 4.w),
        Text(
          title,
          style: AppTextStyles.body1.copyWith(color: AppColors.textSecondary),
        ),
        Spacer(),
        Text(
          value,
          style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
        ),
      ],
    );
  }
}
