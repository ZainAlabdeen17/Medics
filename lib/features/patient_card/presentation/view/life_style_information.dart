import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/patient_card/presentation/cubit/patient_card_cubit.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/activity_level_groups.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/button_groups.dart';

class LifeStyleInformation extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LifeStyleInformation({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PatientCardCubit>();
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.lifeStyleInformation,
              style: AppTextStyles.head1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 8.h),
            Text(
              AppStrings.lifeStyleInformationSub,
              style: AppTextStyles.head2.copyWith(
                color: AppColors.textSecondary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16.h),

            Text(
              AppStrings.smoking,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 12.h),
            ButtonGroups(
              text1: AppStrings.yes,
              text2: AppStrings.no,
              text3: AppStrings.occasionally,
              initialValue: cubit.state.smoking, 
              onSelected: cubit.updateSmoking,
            ),
            SizedBox(height: 16.h),

            Text(
              AppStrings.alcohol,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 12.h),
            ButtonGroups(
              text1: AppStrings.yes,
              text2: AppStrings.no,
              text3: AppStrings.occasionally,
              initialValue: cubit.state.alcohol, 
              onSelected: cubit.updateAlcohol,
            ),
            SizedBox(height: 16.h),

            Text(
              AppStrings.activityLevel,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 12.h),
            ActivityLevelGroups(
              initialValue: cubit.state.activityLevel, 
              onSelected: cubit.updateActivityLevel,
            ),
          ],
        ),
      ),
    );
  }
}