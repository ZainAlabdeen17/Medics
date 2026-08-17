import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_state.dart';
import 'package:medics/features/doctor/presentation/widgets/filter_widgets/custom_filter_chip.dart';

class ExperienceAndGenderFilterSection extends StatelessWidget {
  const ExperienceAndGenderFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final experiences = ['<3 years', '<10 years', '<25 years'];
        final genders = ['Male', 'Female'];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.experience,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: experiences.map((exp) {
                return CustomFilterChip(
                  title: exp,
                  isSelected: state.selectedExperience == exp,
                  onTap: () {
                    context.read<FilterCubit>().selectExperience(exp);
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings.gender,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: genders.map((gen) {
                return CustomFilterChip(
                  title: gen,
                  isSelected: state.selectedGender == gen,
                  onTap: () {
                    context.read<FilterCubit>().selectGender(gen);
                  },
                  width: 165.w,
                );
              }).toList(),
            ),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }
}
