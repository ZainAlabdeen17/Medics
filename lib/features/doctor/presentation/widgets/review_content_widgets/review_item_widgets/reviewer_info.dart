import 'package:flutter/material.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/data/review_model.dart';

class ReviewerInfo extends StatelessWidget {
  const ReviewerInfo({super.key, required this.review});
  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          review.reviewerName,
          style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
        ),
        Text(
          review.reviewDate,
          style: AppTextStyles.body1.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
