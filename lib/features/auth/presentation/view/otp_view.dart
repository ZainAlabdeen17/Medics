import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/functions/show_custom_toast.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_state.dart';
import 'package:medics/features/auth/presentation/widgets/auth_header.dart';
import 'package:medics/features/auth/presentation/widgets/otp_form.dart';

class OtpView extends StatelessWidget {
  final String email;
  const OtpView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is VerifyFailureState) {
          showCustomToast(
            context: context,
            title: state.errorMessage,
            primaryColor: AppColors.iconRed,
            icon: Icon(Icons.cancel_outlined, color: AppColors.iconRed),
          );
        }
        if (state is VerifySuccessState) {
          if (state.isProfileCompleted) {
            context.pushReplacement("/Home");
          } else {
            context.pushReplacement("/Patient");
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),

              child: state is VerifyLoadingState
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.borderAccent,
                      ),
                    )
                  : CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: AuthHeader(
                            text1: AppStrings.medics,
                            text2: AppStrings.codeSent,
                            text3: AppStrings.codeSentSub,
                          ),
                        ),

                        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                        SliverToBoxAdapter(child: OtpForm(email: email)),
                        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
                        SliverToBoxAdapter(
                          child: Text(
                            AppStrings.otpExpiry,
                            style: AppTextStyles.body1.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: 32.h)),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
