import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/general_header_health_metrics.dart';

class Anamnesis extends StatelessWidget {
  const Anamnesis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: GeneralHeaderHealthMetrics(title: AppStrings.anamnesis),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.chronicConditions,
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 4.h)),
              SliverToBoxAdapter(
                child: CustomTextField(hintText: AppStrings.migraines),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.allergies,
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 4.h)),
              SliverToBoxAdapter(
                child: CustomTextField(hintText: AppStrings.peanuts),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
