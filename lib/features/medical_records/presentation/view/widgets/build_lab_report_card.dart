import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/medical_records/data/rebort_model.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/app_icon_button.dart';

class BuildLabReportCard extends StatelessWidget {
  final LabResult labResult;
  const BuildLabReportCard({super.key, required this.labResult});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: AppColors.borderBlack,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labResult.testName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Row(
                children: [
                  Text("02 jan ,2004 .", style: AppTextStyles.body2),
                  SizedBox(width: 12.w),
                  Text(labResult.statusText, style: AppTextStyles.body2),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: AppIconButton(
                    text: AppStrings.viewReport,
                    iconName: Assets.assetsImagesIconsGeneralView,
                    color: AppColors.surfaceAccent,
                    onPressed: () {},
                    isfill: true,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: AppIconButton(
                    text: AppStrings.download,
                    iconName: Assets.assetsImagesIconsGeneralDownload,
                    color: AppColors.surfaceBlur,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
