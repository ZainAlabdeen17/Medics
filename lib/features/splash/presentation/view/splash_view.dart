import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/functions/app_navigation.dart';
import 'package:medics/core/services/service_locator.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/database/cache/cache_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (await getIt<CacheHelper>().getData(key: "onBoardingVisted") != null) {
        if (await getIt<CacheHelper>().getData(key: "onBoardingVisted")) {
          AppNavigation.delayedPushScreen(context, '/SignUp');
        } else {
          AppNavigation.delayedPushScreen(context, '/OnBoarding');
        }
      } else {
        AppNavigation.delayedPushScreen(context, '/OnBoarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150.w,
                height: 150.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.assetsImagesLogo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 47),
              const Text(
                "Medics",
                style: TextStyle(
                  fontFamily: "Syne",
                  fontSize: 64,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff2b6f71),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
