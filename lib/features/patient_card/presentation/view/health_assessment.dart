import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/blood_type.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/small_custom_text_field.dart';

class HealthAssessment extends StatelessWidget {
  const HealthAssessment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
         BloodType(),
          SizedBox(height: 16.h),
          Text(
            AppStrings.allergies,
            style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: 4.h),
          CustomTextField(hintText: AppStrings.enteryourAllergies),
          SizedBox(height: 12.h),
          Text(
            AppStrings.chronicConditions,
            style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: 4.h),
          CustomTextField(hintText: AppStrings.enterYourChronicConditions),
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
                    SmallCustomTextField(hintText: AppStrings.enterYourHeight),
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
                    SmallCustomTextField(hintText: AppStrings.enterYourWeight),
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
                ),
              ),
              SizedBox(width: 4.w),
              Text("/"),
              SizedBox(width: 4.w),
              Expanded(
                child: SmallCustomTextField(
                  hintText: AppStrings.bloodPressureHint,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
