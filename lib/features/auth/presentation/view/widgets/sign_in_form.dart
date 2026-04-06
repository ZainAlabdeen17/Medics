import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/functions/app_navigation.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_fill_button.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/auth_state.dart';
import 'package:medics/features/auth/presentation/view/widgets/password_requerment_item.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of(context);
        final passwordValidator = state.passwordValidator;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.emailLabel,
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
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
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 4.h),
            CustomTextField(
              hintText: AppStrings.passwordHint,
              obscureText: state.obscurePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  authCubit.toggleObscurePassword();
                },
                icon: Icon(
                  state.obscurePassword == false
                      ? Icons.lock_open_outlined
                      : Icons.lock_outline,
                  color: AppColors.iconGreyDisabled,
                  size: 20,
                ),
              ),
              onChanged: (password) {
                authCubit.onPasswordChanged(password);
              },
              hasError:
                  !passwordValidator!.isValid && state.password.isNotEmpty,
            ),
            if (state.password.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  PasswordRequirementItem(
                    isValid: passwordValidator.hasMinLength,
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
              text: AppStrings.login,

              onPressed: state.isFormValid
                  ? () {
                      state.isFormValid
                          ? AppNavigation.pushReplacementScreen(context, "/Otp")
                          : null;
                    }
                  : null,
            ),
          ],
        );
      },
    );
  }
}