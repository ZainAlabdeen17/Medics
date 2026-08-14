import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_fill_button.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_state.dart';
import 'package:medics/features/auth/presentation/cubit/validation_cubit/validation_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/validation_cubit/validation_state.dart';
import 'package:medics/features/auth/presentation/widgets/password_requerment_item.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return BlocBuilder<ValidationCubit, ValidationState>(
          builder: (context, state) {
            final validationCubit = BlocProvider.of<ValidationCubit>(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.firstName,
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  controller: userCubit.signUpFirstNameController,
                  hintText: "Enter your first name",
                  onChanged: (firstName) {
                    validationCubit.onFirstNameChanged(firstName);
                  },
                  errorText: state.firstNameError as String?,
                ),
                SizedBox(height: 12.h),
                Text(
                  AppStrings.lastName,
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  controller: userCubit.signUpLastNameController,
                  hintText: "Enter your last name",
                  onChanged: (lastName) {
                    validationCubit.onLastNameChanged(lastName);
                  },
                  errorText: state.lastNameError as String?,
                ),
                SizedBox(height: 12.h),
                Text(
                  AppStrings.emailLabel,
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  controller: userCubit.signUpEmailController,
                  hintText: AppStrings.emailHint,
                  onChanged: (email) {
                    validationCubit.onEmailChanged(email);
                  },
                  errorText: state.emailError as String?,
                ),
                SizedBox(height: 12.h),
                Text(
                  AppStrings.passwordLabel,
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  controller: userCubit.signUpPasswordController,
                  hintText: AppStrings.passwordHint,
                  obscureText: userCubit.isObSecure,
                  suffixIcon: IconButton(
                    onPressed: () {
                      userCubit.toggleObscurePassword();
                    },
                    icon: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        userCubit.isObSecure == false
                            ? Assets.assetsImagesIconsGeneralView
                            : Assets.assetsImagesIconsGeneralHide,
                        colorFilter: ColorFilter.mode(
                          AppColors.iconGrey,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  onChanged: (password) {
                    validationCubit.onPasswordChanged(password);
                  },
                  hasError:
                      !state.passwordValidator!.isValid &&
                      state.password.isNotEmpty,
                ),
                if (state.password.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      PasswordRequirementItem(
                        isValid: state.passwordValidator!.hasMinLength,
                        text: AppStrings.min8CharactersLength,
                      ),
                      PasswordRequirementItem(
                        isValid: state.passwordValidator!.hasUppercase,
                        text: AppStrings.min1UppercaseLetter,
                      ),
                      PasswordRequirementItem(
                        isValid: state.passwordValidator!.hasTwoNumbers,
                        text: AppStrings.min2Numbers,
                      ),
                    ],
                  ),
                SizedBox(height: 32.h),
                // userCubit.state is SignUpLoadingState
                //     ? Center(
                //         child: CircularProgressIndicator(
                //           color: AppColors.surfaceAccent,
                //         ),
                //       )
                //     :
                CustomFillButton(
                  text: AppStrings.createAccount,
                  onPressed: state.isFormValid
                      ? () async {
                          state.isFormValid ? await userCubit.signUp() : null;
                        }
                      : null,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
