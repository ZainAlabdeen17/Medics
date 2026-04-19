import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/routes/routes.dart';
import 'package:medics/core/utils/app_colors.dart';

void main() {
  runApp(DevicePreview(enabled: false, builder: (context) => MedicsApp()));
}

class MedicsApp extends StatelessWidget {
  const MedicsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          routerConfig: route,
          theme: ThemeData(scaffoldBackgroundColor: AppColors.scaffoldColor),
        );
      },
    );
  }
}
