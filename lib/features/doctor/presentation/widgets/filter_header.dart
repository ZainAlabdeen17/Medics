import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_cubit.dart';

class FilterHeader extends StatelessWidget {
  const FilterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },

              child: Text(
                AppStrings.cancel,
                style: AppTextStyles.head3.copyWith(
                  color: AppColors.textAccent,
                ),
              ),
            ),
            Text(
              AppStrings.filter,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
            ),
            GestureDetector(
              onTap: () {
                context.read<FilterCubit>().isFilterApplayed = true;
                context.read<FilterCubit>().hasFilter();
                Navigator.of(context).pop();
              },
              child: Text(
                AppStrings.apply,
                style: AppTextStyles.head3.copyWith(
                  color: AppColors.textAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
