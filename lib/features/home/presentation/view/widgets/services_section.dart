import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/home/presentation/view/widgets/service_item.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h),
        Text(
          AppStrings.services,
          style: AppTextStyles.head2.copyWith(color: AppColors.textPrimary),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 12.h),
        ServiceItem(
          title: AppStrings.faq,
          onTap: () {
            context.push("/FAQ");
          },
        ),
      ],
    );
  }
}
