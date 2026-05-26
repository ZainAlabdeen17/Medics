import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/doctor/presentation/cubit/review_cubit/review_cubit.dart';

class BigTextReviewFormField extends StatelessWidget {
  const BigTextReviewFormField({super.key, required this.reviewCubit});
  final ReviewCubit reviewCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.review,
          style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 252.h,
          child: CustomTextField(
            controller: reviewCubit.reviewController,
            onChanged: (_) => reviewCubit.updateReview(),
            hintText: AppStrings.tellUsAboutYourVisit,
            maxLines: 10,
            isBigFeild: true,
          ),
        ),
      ],
    );
  }
}
