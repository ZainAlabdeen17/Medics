import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: AppColors.textPrimary,
      unselectedLabelColor: AppColors.textSecondary,
      labelStyle: AppTextStyles.head3,
      dividerColor: Colors.transparent,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 1.w, color: AppColors.borderAccent),
      ),
      tabs: [
        Tab(text: "Book"),
        Tab(text: "About"),
        Tab(text: "Review"),
      ],
    );
  }
}
