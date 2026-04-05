import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/functions/app_navigation.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.alreadyHaveAccount,
              style: AppTextStyles.body1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: () =>
                  AppNavigation.pushReplacementScreen(context, "/SignIn"),
              child: Text(
                AppStrings.login,
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
