import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/widgets/custom_text_field.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: AppStrings.startTyping,
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 4.w),
        child: SizedBox(
          width: 24.w,
          height: 24.w,
          child: SvgPicture.asset(Assets.assetsImagesIconsGeneralSearch),
        ),
      ),
    );
  }
}
