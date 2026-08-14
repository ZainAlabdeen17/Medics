import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medics/core/utils/app_assets.dart';

class AIChatView extends StatelessWidget {
  const AIChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          Assets.assetsImagesAnimationMedicalFrontliners,
          animate: true,
          repeat: true,
        ),
      ),
    );
  }
}
