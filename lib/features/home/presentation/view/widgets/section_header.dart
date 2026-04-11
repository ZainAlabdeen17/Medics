import 'package:flutter/material.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.head2.copyWith(color: AppColors.textPrimary),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            AppStrings.seeAll,
            style: AppTextStyles.head3.copyWith(color: AppColors.textAccent),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
