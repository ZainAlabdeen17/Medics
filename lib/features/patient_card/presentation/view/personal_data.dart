import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/text_field_date.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    //final cubit = context.read<PatientCardCubit>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.personalData,
            style: AppTextStyles.head1.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: 8.h),
          Text(
            AppStrings.personalDataSub,
            style: AppTextStyles.head2.copyWith(
              color: AppColors.textSecondary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),

          Text(
            AppStrings.firstName,
            style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: 4.h),
          CustomTextField(
            hintText: AppStrings.enterYourFirstName,
            onChanged: (value) {
              // cubit.updateFirstName(value);
            },
          ),
          SizedBox(height: 12.h),

          Text(
            AppStrings.lastName,
            style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: 4.h),
          CustomTextField(
            hintText: AppStrings.enterYourLastName,
            onChanged: (value) {
              // cubit.updateLastName(value);
            },
          ),
          SizedBox(height: 12.h),

          Text(
            AppStrings.dateOfBirth,
            style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: 4.h),
          TextFieldDate(
            hintText: AppStrings.ddMmYyyy,
            onDateSelected: (value) {
              // cubit.updateDateOfBirth(value);
            },
          ),
          SizedBox(height: 12.h),

          Text(
            AppStrings.phoneNumber,
            style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: 4.h),
          CustomTextField(
            hintText: AppStrings.phoneNumberField,
            onChanged: (value) {
              // cubit.updatePhoneNumber(value);
            },
          ),
          SizedBox(height: 12.h),

          Text(
            AppStrings.city,
            style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: 4.h),
          CustomTextField(
            hintText: AppStrings.enterCity,
            onChanged: (value) {
              // cubit.updateCity(value);
            },
          ),
        ],
      ),
    );
  }
}
