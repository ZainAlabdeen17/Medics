import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/features/root/presentation/view/widgets/custom_navbar.dart';

class Root extends StatelessWidget {
  const Root({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: navigationShell.currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && navigationShell.currentIndex != 0) {
          navigationShell.goBranch(0, initialLocation: false);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(child: navigationShell),
            Positioned(
              left: 16.w,
              right: 16.w,
              bottom: 0.h,
              child: SafeArea(
                minimum: EdgeInsets.only(bottom: 30.h),
                child: CustomNavbar(navigationShell: navigationShell),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
