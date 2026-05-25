import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/features/doctor/data/review_model.dart';

class StarsRow extends StatelessWidget {
  const StarsRow({super.key, required this.review});
  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < review.rating; i++)
          SizedBox(
            height: 20.h,
            width: 20.w,
            child: SvgPicture.asset(Assets.assetsImagesIconsGeneralStar),
          ),
      ],
    );
  }
}
