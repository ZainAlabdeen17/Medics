import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/build_medical_card.dart';

class MedicalRecordsView extends StatelessWidget {
  const MedicalRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              Text(AppStrings.medicalRecords, style: AppTextStyles.head1),
              SizedBox(height: 16.h),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 32.h,
                  crossAxisSpacing: 12.w,
                  children: [
                    BuildMedicalCard(
                      iconName: Assets.assetsImagesIconsGeneralMedication,
                      name: AppStrings.prescription,
                      location: "/Prescription",
                    ),
                    BuildMedicalCard(
                      iconName: Assets.assetsImagesIconsGeneralMicroscope,
                      name: AppStrings.lapReports,
                      location: "/LabReport",
                    ),
                    BuildMedicalCard(
                      iconName: Assets.assetsImagesIconsGeneralTracker,
                      name: AppStrings.healthMetrics,
                      location: "/HealthMetrics",
                    ),
                    BuildMedicalCard(
                      iconName: Assets.assetsImagesIconsGeneralNote,
                      name: AppStrings.visitSummeries,
                      location: "/VisitSummeries",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
