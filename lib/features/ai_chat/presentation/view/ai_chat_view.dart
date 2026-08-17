import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';

class AIChatView extends StatelessWidget {
  const AIChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: GeneralHeader(title: "Medics Intelligence"),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(
                child: Lottie.asset(
                  Assets.assetsImagesAnimationMedicalFrontliners,
                  animate: true,
                  repeat: true,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(
                child: Text(
                  "This Feature Will Be Ready Soon Stay With Us",
                  style: AppTextStyles.head2.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
