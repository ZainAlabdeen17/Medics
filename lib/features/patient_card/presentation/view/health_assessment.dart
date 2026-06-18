import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/validation/app_validator.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/patient_card/presentation/cubit/patient_card_cubit.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/blood_type.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/small_custom_text_field.dart';

// ignore: must_be_immutable
class HealthAssessment extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const HealthAssessment({super.key, required this.formKey});

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
              AppStrings.healthAssessment,
              style: AppTextStyles.head1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 8.h),
            Text(
              AppStrings.healthAssessmentSub,
              style: AppTextStyles.head2.copyWith(
                color: AppColors.textSecondary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16.h),
            BloodType(
              initialBloodType:cubit.state.bloodType,
              initialRh: cubit.state.rhType,
              onBloodTypeChanged: cubit.updateBloodType,
              onRhChanged:cubit.updateRh,
              
            ),
            SizedBox(height: 16.h),
            Text(
              AppStrings.allergies,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: AppStrings.enteryourAllergies,
              validator: AppValidator.validateAllergies,
              initialValue: cubit.state.allergies,
              onChanged: cubit.updateAllergies,
            ),
            SizedBox(height: 12.h),
            Text(
              AppStrings.chronicConditions,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              initialValue: cubit.state.chronicConditions,
              hintText: AppStrings.enterYourChronicConditions,
              validator: AppValidator.validateChronicConditions,
              onChanged: cubit.updateChronicConditions,
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.yourHieght,
                        style: AppTextStyles.body1.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      SmallCustomTextField(
                        hintText: AppStrings.enterYourHeight,
                        initialValue: cubit.state.height,
                        validator: AppValidator.validateHeight,
                        onChanged: cubit.updateHeight,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.yourWeight,
                        style: AppTextStyles.body1.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      SmallCustomTextField(
                        hintText: AppStrings.enterYourWeight,
                        initialValue: cubit.state.weight,
                        validator: AppValidator.validateWeight,
                        onChanged: cubit.updateWeight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              AppStrings.bloodPressure,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Expanded(
                  child: SmallCustomTextField(
                    hintText: AppStrings.bloodPressureHint,
                    initialValue: cubit.state.systolicPressure,
                    validator: AppValidator.validateBloodPressureSystolic,
                    onChanged: cubit.updateBloodPressureSystolic,
                  ),
                ),
                SizedBox(width: 4.w),
                Text("/"),
                SizedBox(width: 4.w),
                Expanded(
                  child: SmallCustomTextField(
                    hintText: AppStrings.bloodPressureHint,
                    initialValue: cubit.state.diastolicPressure,
                    validator: AppValidator.validateBloodPressureDiastolic,
                    onChanged: cubit.updateBloodPressureDiastolic,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
