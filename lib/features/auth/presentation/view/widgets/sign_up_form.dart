import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/functions/app_navigation.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_fill_button.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/auth/presentation/cubit/update_cubit/update_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/update_cubit/update_state.dart';
import 'package:medics/features/auth/presentation/cubit/validation_cubit/auth_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/validation_cubit/auth_state.dart';
import 'package:medics/features/auth/presentation/view/widgets/password_requerment_item.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateCubit(),
      child: BlocBuilder<ValidationCubit, ValidationState>(
        builder: (context, state) {
          ValidationCubit authCubit = BlocProvider.of(context);
          final passwordValidator = state.passwordValidator;
          final password = state.password;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.emailLabel,
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              CustomTextField(
                hintText: AppStrings.emailHint,
                onChanged: (email) {
                  authCubit.onEmailChanged(email);
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
              BlocBuilder<UpdateCubit, UpdateState>(
                builder: (context, state) {
                  final updateCubit = BlocProvider.of<UpdateCubit>(context);
                  return CustomTextField(
                    hintText: AppStrings.passwordHint,
                    obscureText: state.obSecurePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        updateCubit.toggleObscurePassword();
                      },
                      icon: SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          state.obSecurePassword == false
                              ? Assets.assetsImagesIconsGeneralView
                              : Assets.assetsImagesIconsGeneralHide,
                        ),
                      ),
                    ),
                    onChanged: (password) {
                      authCubit.onPasswordChanged(password);
                    },
                    hasError:
                        !passwordValidator!.isValid && password.isNotEmpty,
                  );
                },
              ),
              if (state.password.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
                    PasswordRequirementItem(
                      isValid: passwordValidator!.hasMinLength,
                      text: AppStrings.min8CharactersLength,
                    ),
                    PasswordRequirementItem(
                      isValid: passwordValidator.hasUppercase,
                      text: AppStrings.min1UppercaseLetter,
                    ),
                    PasswordRequirementItem(
                      isValid: passwordValidator.hasTwoNumbers,
                      text: AppStrings.min2Numbers,
                    ),
                  ],
                ),
              SizedBox(height: 32.h),
              CustomFillButton(
                text: AppStrings.createAccount,
                onPressed: state.isFormValid
                    ? () {
                        state.isFormValid
                            ? {
                                AppNavigation.pushReplacementScreen(
                                  context,
                                  "/Otp",
                                ),
                              }
                            : null;
                      }
                    : null,
              ),
            ],
          );
        },
      ),
    );
  }
}
