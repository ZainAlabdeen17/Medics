import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_form_widgets/doctor_info.dart';

class CustomChatHeader extends StatelessWidget {
  const CustomChatHeader({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: SizedBox(
            width: 24.w,
            height: 24.h,
            child: SvgPicture.asset(Assets.assetsImagesIconsGeneralArrowLeft),
          ),
        ),
        SizedBox(width: 12.w),
        DoctorInfo(doctor: doctor),
      ],
    );
  }
}
