import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });
  final String text1;
  final String text2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: AppTextStyles.body1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: onTap,
              child: Text(
                text2,
                style: AppTextStyles.head3.copyWith(
                  color: AppColors.textAccent,
                ),
              ),
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ],
    );
  }
}
