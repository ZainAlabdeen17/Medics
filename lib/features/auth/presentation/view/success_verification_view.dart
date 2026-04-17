import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/functions/app_navigation.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/button_class.dart';

class SuccessVerificationView extends StatelessWidget {
  const SuccessVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 98.h)),
              SliverToBoxAdapter(
                child: Container(
                  width: 320.w,
                  height: 344.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.assetsImagesVerificationSuccess),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 63.h)),
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.successfullyVerified,
                  style: AppTextStyles.head1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 8.h)),
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.successSub,
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            
            SliverToBoxAdapter(child: SizedBox(height: 32.h)),
            SliverToBoxAdapter(
              child: ButtonClass.customFillButton(
                text: AppStrings.completeCard,
                onPressed: () {
                    AppNavigation.pushReplacementScreen(context, "/Patient");
                },)

              ),
            ],
          ),
        ),
      ),
    );
  }
}
