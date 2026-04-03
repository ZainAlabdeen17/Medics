import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/functions/navgation.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Navgation.delayedPushScreen(context, '/OnBoarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 305.h),
              Container(
                width: 150.w,
                height: 150.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.assetsImagesLogo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 47.h),
              Text(
                AppStrings.medics,
                style: AppTextStyles.head.copyWith(color: AppColors.textAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
