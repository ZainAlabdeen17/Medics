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
        SizedBox(
          width: 375.w,
          height: 50.h,
          child: Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: Text(
              text1,
              style: AppTextStyles.head1.copyWith(color: AppColors.textAccent),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Text(
            text2,
            style: AppTextStyles.head1.copyWith(color: AppColors.textPrimary),
          ),
        ),
        Text(
          text3,
          style: AppTextStyles.body2.copyWith(color: AppColors.textSecondary),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
