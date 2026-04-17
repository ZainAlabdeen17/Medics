import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/city_search_delegate.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/text_field_city.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/text_field_phone_number.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/text_field_relationship.dart';

class EmergencyContact extends StatelessWidget {
  // final PageController pageController;
  const EmergencyContact({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.emergencyContact,
            style: AppTextStyles.head1.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: 8.h),
          Text(
            AppStrings.emergencyContactSub,
            style: AppTextStyles.head2.copyWith(
              color: AppColors.textSecondary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),

          Text(AppStrings.firstName, style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary)),
          SizedBox(height: 4.h),
          CustomTextField(hintText: AppStrings.enterYourFirstName),
          SizedBox(height: 12.h),

          Text(AppStrings.lastName, style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary)),
          SizedBox(height: 4.h),
          CustomTextField(hintText: AppStrings.enterYourLastName),
          SizedBox(height: 12.h),

          Text(AppStrings.relationship, style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary)),
          SizedBox(height: 4.h),
          TextFieldRelationship(hintText: AppStrings.relationshipField),
          SizedBox(height: 12.h),

          Text(AppStrings.phoneNumber, style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary)),
          SizedBox(height: 4.h),
          TextFieldPhoneNumber(hintText: AppStrings.phoneNumberField),
          SizedBox(height: 12.h),

          Text(AppStrings.email, style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary)),
          SizedBox(height: 4.h),
          CustomTextField(hintText: AppStrings.emailField),
          SizedBox(height: 12.h),

          Text(AppStrings.city, style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary)),
          SizedBox(height: 4.h),
          TextFieldCity(
            hintText: AppStrings.enterCity,
            onTap: () {
              showSearch(context: context, delegate: CitySearchDelegate());
            },
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
