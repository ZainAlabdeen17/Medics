import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
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
                            child: SvgPicture.asset(
                              Assets.assetsImagesIconsGeneralArrowLeft,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: SvgPicture.asset(
                              Assets.assetsImagesIconsGeneralFavourite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  height: 264.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: Container(
                          width: 264.w,
                          height: 264.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.assetsImagesDoctorsDoctor9,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
