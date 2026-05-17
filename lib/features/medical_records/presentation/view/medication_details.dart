import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/medical_records/data/medication_model.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/medication_information_card.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/points_item.dart';

class MedicationDetails extends StatelessWidget {
  const MedicationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final medication = GoRouterState.of(context).extra as Medication;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: GeneralHeader(title: AppStrings.medicationDetails),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 28.h)),
              SliverToBoxAdapter(
                child: MedicationInformationCard(medication: medication),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.specialInstructions,
                  style: AppTextStyles.head3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 8.h)),

              SliverToBoxAdapter(
                child: PointsItem(text: medication.specialInstructions),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.storage,
                  style: AppTextStyles.head3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 8.h)),
              SliverToBoxAdapter(child: PointsItem(text: medication.storage)),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.sideEffects,
                  style: AppTextStyles.head3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 8.h)),

              SliverToBoxAdapter(
                child: PointsItem(text: medication.sideEffects),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.allergyWarning,
                  style: AppTextStyles.head3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 8.h)),
              SliverToBoxAdapter(
                child: PointsItem(text: medication.allergyWarning),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
