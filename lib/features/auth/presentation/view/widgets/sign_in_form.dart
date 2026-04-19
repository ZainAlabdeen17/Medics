import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_fill_button.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/auth_state.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of(context);
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
              hasError: state.password.isEmpty,
            ),
            SizedBox(height: 32.h),
            CustomFillButton(
              text: AppStrings.login,
              onPressed: state.isFormValid
                  ? () {
                      state.isFormValid ? context.go("/Home") : null;
                    }
                  : null,
            ),
          ],
        );
      },
    );
  }
}
