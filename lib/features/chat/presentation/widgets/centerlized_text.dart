import 'package:flutter/material.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class CenerlizedText extends StatelessWidget {
  const CenerlizedText({super.key, required this.note});
  final String note;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        note,
        style: AppTextStyles.body1.copyWith(color: AppColors.textSecondary),
        textAlign: TextAlign.center,
      ),
    );
  }
}
