import 'package:flutter/material.dart';
import 'package:medics/core/utils/app_colors.dart';

class CustomCircleProgressIndicator extends StatelessWidget {
  const CustomCircleProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppColors.surfaceAccent),
    );
  }
}
