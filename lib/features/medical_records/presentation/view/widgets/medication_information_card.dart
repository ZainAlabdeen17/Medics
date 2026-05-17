import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/medical_records/data/medication_model.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/medication_card_item.dart';

class MedicationInformationCard extends StatelessWidget {
  final Medication medication;
  const MedicationInformationCard({super.key, required this.medication});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppColors.borderBlack,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MedicationCardItem(
            iconName: Assets.assetsImagesIconsGeneralMedication,
            title: AppStrings.name,
            value: medication.name,
          ),
          SizedBox(height: 16.h),
          MedicationCardItem(
            iconName: Assets.assetsImagesIconsGeneralCalendar,
            title: AppStrings.duration,
            value:
                "${medication.startDate.day} / ${medication.startDate.month}  -  ${medication.endDate.day} / ${medication.endDate.month} , ${medication.endDate.year}",
          ),
          SizedBox(height: 16.h),
          MedicationCardItem(
            iconName: Assets.assetsImagesIconsGeneralDosage,
            title: AppStrings.dosage,
            value: medication.dosage.toString(),
          ),
          SizedBox(height: 16.h),
          MedicationCardItem(
            iconName: Assets.assetsImagesIconsGeneralFrequency,
            title: AppStrings.frequency,
            value: medication.timesPerDay.toString(),
          ),
          SizedBox(height: 16.h),
          MedicationCardItem(
            iconName: Assets.assetsImagesIconsGeneralDoctor,
            title: AppStrings.prescibedBy,
            value: medication.prescribedBy,
          ),
        ],
      ),
    );
  }
}
