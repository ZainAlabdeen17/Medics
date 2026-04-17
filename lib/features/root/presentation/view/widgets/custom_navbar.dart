import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/features/root/presentation/view/widgets/custom_navbar_item.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),

      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: AppColors.borderBlack),
        boxShadow: const [
          BoxShadow(color: Color.fromRGBO(43, 111, 113, 0.2), blurRadius: 30),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomNavbarItem(
            navigationShell: navigationShell,
            index: 0,
            icon: Assets.assetsImagesIconsNavbarInHome,
          ),
          CustomNavbarItem(
            navigationShell: navigationShell,
            index: 1,
            icon: Assets.assetsImagesIconsNavbarInArchive,
          ),
          CustomNavbarItem(
            navigationShell: navigationShell,
            index: 2,
            icon: Assets.assetsImagesIconsNavbarInChat,
          ),
          CustomNavbarItem(
            navigationShell: navigationShell,
            index: 3,
            icon: Assets.assetsImagesIconsNavbarInProfile,
          ),
        ],
      ),
    );
  }
}
