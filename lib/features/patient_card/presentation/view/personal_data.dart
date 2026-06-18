import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/validation/app_validator.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/patient_card/presentation/cubit/patient_card_cubit.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/text_field_date.dart';

class PersonalData extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const PersonalData({super.key, required this.formKey});

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
              AppStrings.dateOfBirth,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 4.h),
            BlocBuilder<PatientCardCubit, PatientCardState>(
              builder: (context, state) {
                return TextFieldDate(
                  hintText: AppStrings.ddMmYyyy,
                  initialDate: cubit.state.dateOfBirth,
                  onDateSelected: (value) {
context.read<PatientCardCubit>().updateDateOfBirth(value);                  },
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
              initialValue: cubit.state.phoneNumber,

              onChanged: (value) {
                cubit.updatePhoneNumber(value);
              },
              validator: AppValidator.validatePhoneNumber,
            ),
            SizedBox(height: 12.h),

            Text(
              AppStrings.city,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: AppStrings.enterCity,
              validator: AppValidator.validateCity,
              initialValue: cubit.state.phoneNumber,

              onChanged: (value) {
                cubit.updateCity(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
