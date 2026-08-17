import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/on_error_widget.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_state.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_item.dart';
import 'package:medics/features/doctor/presentation/widgets/shimmers/doctor_item_shimmer.dart';

class DoctorsGrid extends StatelessWidget {
  const DoctorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        if (state is DoctorLoading) {
          return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.h,
              mainAxisSpacing: 32.h,
              mainAxisExtent: 250.h,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => const DoctorItemShimmer(),
              childCount: 6,
            ),
          );
        }
        if (state is DoctorFailure) {
          return SliverFillRemaining(child: OnErrorWidget());
        }
        if (state is DoctorSuccess) {
          if (state.doctors.isEmpty &&
              context.read<FilterCubit>().returnIfWeHaveActiveFilter()) {
            return SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 48.h,
                      width: 48.w,
                      child: SvgPicture.asset(
                        Assets.assetsImagesIconsGeneralSearch,
                        colorFilter: ColorFilter.mode(
                          AppColors.iconAccent,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Sorry, no results found",
                      style: AppTextStyles.head2.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'No results match your filters. Please try adjusting them.',
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
          return SliverGrid.builder(
            itemCount: state.doctors.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.w,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 32.h,
              mainAxisExtent: 250.h,
            ),
            itemBuilder: (context, index) {
              return DoctorItem(doctor: state.doctors[index]);
            },
          );
        }
        return SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
