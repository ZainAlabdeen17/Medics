import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/database/cache/cache_helper.dart';
import 'package:medics/core/services/service_locator.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/validation/app_validator.dart';
import 'package:medics/core/widgets/custom_fill_button.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_state.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          getIt<CacheHelper>().saveData(key: "isLoggedIn", value: true);
          context.pushReplacement("/Home");
        }
        if (state is SignInFailureState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        final userCubit = BlocProvider.of<UserCubit>(context);
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
                controller: userCubit.emailController,
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
                controller: userCubit.passwordController,
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
                    ),
                  ),
                ),
                validator: (value) => AppValidator.validatePassword(value),
              ),
              SizedBox(height: 32.h),
              state is SignInLoadingState
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.surfaceAccent,
                      ),
                    )
                  : CustomFillButton(
                      text: AppStrings.login,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await userCubit.signIn();
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
