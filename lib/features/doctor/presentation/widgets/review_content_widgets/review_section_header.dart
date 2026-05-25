import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_dialog.dart';
import 'package:medics/features/doctor/data/doctor_model.dart';
import 'package:medics/features/doctor/data/review_model.dart';

class ReviewSectionHeader extends StatelessWidget {
  const ReviewSectionHeader({
    super.key,
    required this.doctor,
    required this.reviews,
  });
  final DoctorModel doctor;
  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          onTap: () async {
            final result = await context.push("/ReviewForm", extra: doctor);
            if (!context.mounted) return;
            if (result == true) {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDialog();
                },
              );
            }
          },
          child: Row(
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: SvgPicture.asset(Assets.assetsImagesIconsGeneralReview),
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
    );
  }
}
