import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/home/presentation/view/widgets/service_item.dart';

class ServicesSection extends StatelessWidget {
  ServicesSection({super.key});
  final List<String> services = [
    AppStrings.appointments,
    AppStrings.faq,
    AppStrings.supportChat,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        Text(
          AppStrings.services,
          style: AppTextStyles.head2.copyWith(color: AppColors.textPrimary),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 200.h,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ServiceItem(title: services[index]);
            },
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
