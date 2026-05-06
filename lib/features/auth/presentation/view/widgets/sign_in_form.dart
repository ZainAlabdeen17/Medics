import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/validation/app_validator.dart';
import 'package:medics/core/widgets/custom_fill_button.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/auth/presentation/cubit/update_cubit/update_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/update_cubit/update_state.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateCubit(),
      child: BlocBuilder<UpdateCubit, UpdateState>(
        builder: (context, state) {
          final updateCubit = BlocProvider.of<UpdateCubit>(context);
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
                  validator: (value) => AppValidator.validateEmail(value),
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
                  validator: (value) => AppValidator.validatePassword(value),
                ),
                SizedBox(height: 32.h),
                CustomFillButton(
                  text: AppStrings.login,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.go('/Home');
                    } else {
                      null;
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
