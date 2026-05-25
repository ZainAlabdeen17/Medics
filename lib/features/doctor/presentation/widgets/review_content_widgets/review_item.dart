import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/data/review_model.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_item_widgets/person_avatar.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_item_widgets/reviewer_info.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_item_widgets/stars_row.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review});
  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PersonAvatar(),
            SizedBox(width: 8.w),
            ReviewerInfo(review: review),
            Spacer(),
            StarsRow(review: review),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          review.reviewText,
          style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
        ),
      ],
    );
  }
}
