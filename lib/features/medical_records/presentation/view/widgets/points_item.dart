import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class PointsItem extends StatelessWidget {
  final String text;
  const PointsItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: SvgPicture.asset(Assets.assetsImagesIconsGeneralFrame),
        ),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body1,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
