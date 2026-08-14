import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

void showMedicalTestImageBottomSheet(
  BuildContext context,
  String imageUrl,
  String title,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    sheetAnimationStyle: AnimationStyle(
      curve: Curves.bounceIn,
      duration: Duration(milliseconds: 500),
    ),
    backgroundColor: AppColors.scaffoldColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: AppColors.iconGreyDisabled,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            Text(
              title,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: InteractiveViewer(
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.borderAccent,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                        color: AppColors.iconGreyDisabled,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
