import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/data/doctor_model.dart';
import 'package:medics/features/doctor/data/review_model.dart';

class DoctorReviewContent extends StatelessWidget {
  const DoctorReviewContent({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    final reviews = ReviewModel.getDummyReviews();
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 15.h,
        bottom: 20.h,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${reviews.length} Reviews",
                  style: AppTextStyles.head3.copyWith(
                    fontFamily: "Inter",
                    color: AppColors.textPrimary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.push("/ReviewForm", extra: doctor);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 20.h,
                        child: SvgPicture.asset(
                          Assets.assetsImagesIconsGeneralReview,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        AppStrings.leaveAReview,
                        style: AppTextStyles.head3.copyWith(
                          color: AppColors.textAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverList.separated(
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.surfaceCard,
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: SvgPicture.asset(
                              Assets.assetsImagesIconsGeneralProfile,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviews[index].reviewerName,
                            style: AppTextStyles.head3.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            reviews[index].reviewDate,
                            style: AppTextStyles.body1.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < reviews[index].rating; i++)
                            SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: SvgPicture.asset(
                                Assets.assetsImagesIconsGeneralStar,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    reviews[index].reviewText,
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 15.h),
          ),
        ],
      ),
    );
  }
}
