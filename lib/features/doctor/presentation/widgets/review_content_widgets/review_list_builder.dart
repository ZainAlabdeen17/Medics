import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/presentation/cubit/review_cubit/review_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/review_cubit/review_state.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_item.dart';

class ReviewListBuilder extends StatelessWidget {
  const ReviewListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        if (state is GetReviewFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.btnSecondary,
                ),
              ),
            ),
          );
        }
        if (state is GetReviewLoading) {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 100.h),
                Center(
                  child: CircularProgressIndicator(
                    color: AppColors.borderAccent,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is GetReviewSuccess) {
          if (state.reviews.isNotEmpty) {
            return SliverList.separated(
              itemCount: state.reviews.length,
              itemBuilder: (context, index) {
                return ReviewItem(review: state.reviews[index]);
              },
              separatorBuilder: (context, index) => SizedBox(height: 15.h),
            );
          } else {
            return SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 100.h),
                  Center(
                    child: Text(
                      'There are no reviews yet.',
                      style: AppTextStyles.body2.copyWith(
                        color: AppColors.btnSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }
        return SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
