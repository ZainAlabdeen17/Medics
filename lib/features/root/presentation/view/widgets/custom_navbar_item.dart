import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_colors.dart';

class CustomNavbarItem extends StatelessWidget {
  const CustomNavbarItem({
    super.key,
    required this.navigationShell,
    required this.index,
    required this.icon,
  });
  final StatefulNavigationShell navigationShell;
  final int index;
  final String icon;

  @override
  Widget build(BuildContext context) {
    bool isActive = navigationShell.currentIndex == index;
    return GestureDetector(
      onTap: () {
        navigationShell.goBranch(index);
      },
      child: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          color: isActive ? AppColors.btnPrimary : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SizedBox(
            height: 48.h,
            width: 48.w,
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.iconStaticWhite : AppColors.iconAccent,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
