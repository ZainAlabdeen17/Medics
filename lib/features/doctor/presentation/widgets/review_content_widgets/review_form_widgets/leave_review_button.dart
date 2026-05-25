import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/widgets/custom_fill_button.dart';
import 'package:medics/features/doctor/presentation/cubit/review_cubit/review_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/review_cubit/review_state.dart';

class LeaveReviewButton extends StatelessWidget {
  const LeaveReviewButton({
    super.key,
    required this.reviewCubit,
    required this.state,
  });
  final ReviewCubit reviewCubit;
  final ReviewState state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
        child: state is ReviewLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: AppColors.btnPrimary),
                ],
              )
            : CustomFillButton(
                text: AppStrings.leaveAReview,
                onPressed:
                    reviewCubit.rating != 0 &&
                        reviewCubit.reviewController.text.trim().isNotEmpty
                    ? () {
                        reviewCubit.submitReview();
                      }
                    : null,
              ),
      ),
    );
  }
}
