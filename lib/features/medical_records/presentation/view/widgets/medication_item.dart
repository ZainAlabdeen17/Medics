import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/medical_records/data/medication_model.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/genaral_chip.dart';

class MedicationItem extends StatelessWidget {
  final PrescriptionModel medication;
  const MedicationItem({super.key, required this.medication});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/MedicationDetails", extra: medication);
      },
      child: Container(
        height: 145.h,
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(width: 1.w, color: AppColors.borderBlack),
          color: AppColors.surfaceBlur,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: SvgPicture.asset(
                    Assets.assetsImagesIconsGeneralMedication,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  medication.name,
                  style: AppTextStyles.head3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              medication.category,
              style: AppTextStyles.body1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GenaralChip(title: medication.formAndQuantity),
                SizedBox(width: 8.w),
                GenaralChip(
                  title: DateFormat('dd MMMM yyyy').format(medication.date),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
