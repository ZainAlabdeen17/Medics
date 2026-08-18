import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';

class DoctorDetailsHeader extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorDetailsHeader({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        height: 48.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: SvgPicture.asset(
                      Assets.assetsImagesIconsGeneralArrowLeft,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 12.w),
                    GestureDetector(
                      onTap: () {
                        context.push('/ChatView', extra: doctor);
                      },
                      child: SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          Assets.assetsImagesIconsGeneralSend,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
