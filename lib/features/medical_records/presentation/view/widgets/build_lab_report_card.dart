import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gal/gal.dart';
import 'package:intl/intl.dart';
import 'package:medics/core/functions/show_custom_toast.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/medical_records/data/models/medical_test_model.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/app_icon_button.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/show_medical_test_bottom_sheet.dart';

class BuildLabReportCard extends StatefulWidget {
  final MedicalTestModel medicalTest;
  final String? reportType;

  const BuildLabReportCard({
    super.key,
    required this.medicalTest,
    this.reportType = "Lab Report",
  });

  @override
  State<BuildLabReportCard> createState() => _BuildLabReportCardState();
}

class _BuildLabReportCardState extends State<BuildLabReportCard> {
  bool isDownloading = false;

  Future<void> _downloadImage() async {
    setState(() => isDownloading = true);
    try {
      final hasAccess = await Gal.hasAccess();
      if (!hasAccess) {
        await Gal.requestAccess();
      }

      final response = await Dio().get<List<int>>(
        widget.medicalTest.url,
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.data != null) {
        await Gal.putImageBytes(Uint8List.fromList(response.data!));
        if (mounted) {
          return showCustomToast(
            context: context,
            title: "Downloaded successfully!",
            primaryColor: AppColors.iconGreen,
            icon: Icon(Icons.check_sharp, color: AppColors.borderGreen),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        showCustomToast(
          context: context,
          title: "Try downlaod report again",
          primaryColor: AppColors.iconRed,
          icon: Icon(Icons.cancel_outlined, color: AppColors.iconRed),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isDownloading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'dd MMM ,yyyy',
    ).format(widget.medicalTest.createdAt);

    return Container(
      height: 162.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppColors.borderBlack,
      ),
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: SvgPicture.asset(
                    widget.reportType == "Lab Report"
                        ? Assets.assetsImagesIconsGeneralMicroscope
                        : Assets.assetsImagesIconsSpecializatiosPulmonologist,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  widget.medicalTest.name,
                  style: AppTextStyles.head3.copyWith(
                    color: AppColors.textPrimary,
                    fontFamily: "Inter",
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Text(
              formattedDate,
              style: AppTextStyles.body2.copyWith(
                color: AppColors.textGreen,
                fontFamily: "Inter",
              ),
            ),
            SizedBox(height: 17.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: AppIconButton(
                    text: AppStrings.viewReport,
                    iconName: Assets.assetsImagesIconsGeneralView,
                    color: AppColors.surfaceAccent,
                    onPressed: () {
                      showMedicalTestImageBottomSheet(
                        context,
                        widget.medicalTest.url,
                        widget.medicalTest.name,
                      );
                    },
                    isfill: true,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: isDownloading
                      ? Center(
                          child: SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.borderAccent,
                            ),
                          ),
                        )
                      : AppIconButton(
                          text: AppStrings.download,
                          iconName: Assets.assetsImagesIconsGeneralDownload,
                          color: AppColors.surfaceBlur,
                          onPressed: _downloadImage,
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
