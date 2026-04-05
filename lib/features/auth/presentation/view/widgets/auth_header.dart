import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  const AuthHeader({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 56.h),
        Text(
          text1,
          style: AppTextStyles.head1.copyWith(
            fontSize: 30.sp,
            color: AppColors.textAccent,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          text2,
          style: AppTextStyles.head1.copyWith(color: AppColors.textPrimary),
        ),
        SizedBox(height: 8.h),
        Text(
          text3,
          style: AppTextStyles.body2.copyWith(color: AppColors.textSecondary),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
