import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/functions/app_navigation.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_fill_button.dart';
import 'package:medics/features/auth/presentation/widgets/auth_header.dart';
import 'package:medics/features/auth/presentation/widgets/otp_form.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AuthHeader(
                  text1: AppStrings.medics,
                  text2: AppStrings.codeSent,
                  text3: AppStrings.codeSentSub,
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(child: OtpForm()),
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
              SliverToBoxAdapter(
                child: CustomFillButton(
                  text: AppStrings.confirm,
                  onPressed: () {
                    AppNavigation.pushReplacementScreen(
                      context,
                      '/SuccessVerification',
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 12.h)),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    AppStrings.resend,
                    style: AppTextStyles.head3.copyWith(
                      color: AppColors.textAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
