import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_state.dart';
import 'package:medics/features/doctor/presentation/widgets/filter_widgets/custom_check_box.dart';
import 'package:medics/features/specialization/data/specialization_model.dart';

class SpecFilterSection extends StatelessWidget {
  const SpecFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final isVisible = state.showAll
            ? specializations
            : specializations.take(5);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.specializations,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 12.h),
            ...isVisible.map((spec) {
              final isSelected = state.selectedSpecializations.contains(
                spec.id,
              );
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomCheckBox(
                      isSelected: isSelected,
                      onTap: () {
                        context.read<FilterCubit>().toggleSpecialization(
                          spec.id,
                        );
                      },
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      spec.name,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            }),
            GestureDetector(
              onTap: () {
                context.read<FilterCubit>().toggleShowAll();
              },
              child: state.showAll
                  ? Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppStrings.showLess,
                        style: AppTextStyles.head3.copyWith(
                          color: AppColors.textAccent,
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppStrings.showAll,
                        style: AppTextStyles.head3.copyWith(
                          color: AppColors.textAccent,
                        ),
                      ),
                    ),
            ),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }
}
