import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/validation/app_validator.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/patient_card/presentation/cubit/patient_card_cubit.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/text_field_relationship.dart';

class EmergencyContact extends StatelessWidget {
  const EmergencyContact({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
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

            Text(
              AppStrings.firstName,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: AppStrings.enterYourFirstName,
              initialValue: cubit.state.emergencyFirstName,
              validator: AppValidator.nameValidator,
              onChanged: cubit.updateEmergencyFirstName,
            ),
            SizedBox(height: 12.h),

            Text(
              AppStrings.lastName,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: AppStrings.enterYourLastName,
              initialValue: cubit.state.emergencyLastName,
              validator: AppValidator.nameValidator,
              onChanged: cubit.updateEmergencyLastName,
            ),
            SizedBox(height: 12.h),

            Text(
              AppStrings.relationship,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 4.h),
            BlocBuilder<PatientCardCubit, PatientCardState>(
              builder: (context, state) {
                return TextFieldRelationship(
                  initialValue: cubit.state.relationship,
                  hintText: AppStrings.relationshipField,
                  onRelationshipSelected: (value) {
                    context.read<PatientCardCubit>().updateRelationship(value);
                  },
                );
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
              initialValue: cubit.state.emergencyPhone,
              validator: AppValidator.validatePhoneNumber,
              onChanged: cubit.updateEmergencyPhone,
            ),
            SizedBox(height: 12.h),

            Text(
              AppStrings.email,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: AppStrings.emailField,
              initialValue: cubit.state.emergencyEmail,
              validator: AppValidator.validateEmail,
              onChanged: cubit.updateEmergencyEmail,
            ),
            SizedBox(height: 12.h),

            Text(
              AppStrings.city,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: AppStrings.enterCity,
              initialValue: cubit.state.emergencyCity,
              validator: AppValidator.validateCity,
              onChanged: cubit.updateEmergencyCity,
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
