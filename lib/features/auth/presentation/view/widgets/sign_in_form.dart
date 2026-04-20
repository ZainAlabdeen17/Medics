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
  SignInForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of(context);
        return Form(
          key: _formKey,
          child: Column(
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
                  authCubit.signInemail = email;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'email is required!';
                  }
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return 'invalid email!';
                  }

                  return null;
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
                  authCubit.signInPassword = password;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'password is requiered!';
                  }

                  if (value.length <= 8) {
                    return 'password is too short!';
                  }

                  if (!value.contains(RegExp(r'[A-Z]'))) {
                    return 'password must contain at least one upper case later';
                  }

                  int digitCount = value
                      .replaceAll(RegExp(r'[^0-9]'), '')
                      .length;
                  if (digitCount < 2) {
                    return 'password must have two numbers at least';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.h),
              CustomFillButton(
                text: AppStrings.login,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.go('/Home');
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
