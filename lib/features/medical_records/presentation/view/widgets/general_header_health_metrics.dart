import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class GeneralHeaderHealthMetrics extends StatelessWidget {
  const GeneralHeaderHealthMetrics({
    super.key,
    required this.title,
    this.onSave,
  });

  final String title;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.pop(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Text(
                  AppStrings.cancel,
                  style: AppTextStyles.head3.copyWith(
                    color: AppColors.textAccent,
                  ),
                ),
              ),
            ),

            const Spacer(),

            Expanded(
              flex: 5,
              child: Text(
                title,
                style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),

            const Spacer(),

            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onSave?.call(), 
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Text(
                  AppStrings.save,
                  style: AppTextStyles.head3.copyWith(
                    color: AppColors.textAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}