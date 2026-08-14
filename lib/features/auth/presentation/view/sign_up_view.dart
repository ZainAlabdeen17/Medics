import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/functions/app_navigation.dart';
import 'package:medics/core/functions/show_custom_toast.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_state.dart';
import 'package:medics/features/auth/presentation/cubit/validation_cubit/validation_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/validation_cubit/validation_state.dart';
import 'package:medics/features/auth/presentation/widgets/auth_footer.dart';
import 'package:medics/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:medics/features/auth/presentation/widgets/auth_header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          context.pushReplacement("/Otp", extra: state.email);
        }
        if (state is SignUpFailureState) {
          showCustomToast(
            context: context,
            title: state.errorMessage,
            primaryColor: AppColors.iconRed,
            icon: Icon(Icons.cancel_outlined, color: AppColors.iconRed),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoadingState,
          progressIndicator: CircularProgressIndicator(
            color: AppColors.borderAccent,
          ),
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: AuthHeader(
                        text1: AppStrings.medics,
                        text2: AppStrings.createAnAccount,
                        text3: AppStrings.excited,
                      ),
                    ),
                    SliverToBoxAdapter(child: SignUpForm()),
                    BlocBuilder<ValidationCubit, ValidationState>(
                      builder: (context, state) {
                        return SliverToBoxAdapter(
                          child: SizedBox(
                            height: state.password.isNotEmpty ? 20.h : 90.h,
                          ),
                        );
                      },
                    ),
                    SliverToBoxAdapter(
                      child: AuthFooter(
                        text1: AppStrings.alreadyHaveAccount,
                        text2: AppStrings.login,
                        onTap: () {
                          AppNavigation.pushReplacementScreen(
                            context,
                            '/SignIn',
                          );
                          // AppNavigation.pushReplacementScreen(context, '/Patient');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
