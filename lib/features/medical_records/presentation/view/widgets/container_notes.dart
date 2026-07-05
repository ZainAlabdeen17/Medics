import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class ContainerNotes extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged; // 1. إضافة المتغير هنا

  const ContainerNotes({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged, // 2. تمريره في الـ Constructor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.borderBlack,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: TextField(
          controller: controller,
          maxLines: null,
          onChanged: onChanged, // 3. ربطه بالـ TextField ليقوم بتحديث الـ Cubit أثناء الكتابة
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.body1.copyWith(
              color: AppColors.textPrimary,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}