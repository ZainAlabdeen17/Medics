import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class MetricRow extends StatelessWidget {
  final String title;
  final String? value;

  const MetricRow({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.body2.copyWith(color: AppColors.textSecondary),
          ),
          Text(
            value ?? '—',
            style: AppTextStyles.body2.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}



