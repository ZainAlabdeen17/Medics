import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/presentation/cubit/review_cubit/review_cubit.dart';

class SelectionStarRow extends StatelessWidget {
  const SelectionStarRow({super.key, required this.reviewCubit});
  final ReviewCubit reviewCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 113.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.overallRating,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 8.h),
            Row(
              children: List.generate(5, (index) {
                final starIndex = index + 1;
                return StarButton(
                  icon: starIndex <= reviewCubit.rating
                      ? Assets.assetsImagesIconsGeneralReviewStar
                      : Assets.assetsImagesIconsGeneralEmptyStar,
                  onTap: () {
                    reviewCubit.changeRating(starIndex);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class StarButton extends StatelessWidget {
  const StarButton({super.key, required this.icon, required this.onTap});

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(100.r),
        onTap: onTap,
        child: Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: AppColors.surfaceBlur,
            border: Border.all(color: AppColors.borderBlack, width: 1.w),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(icon),
            ),
          ),
        ),
      ),
    );
  }
}
