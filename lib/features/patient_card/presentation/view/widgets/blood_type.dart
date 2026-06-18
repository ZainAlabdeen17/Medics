import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class BloodType extends StatefulWidget {
  final String initialBloodType;
  final String initialRh;
  final Function(String) onBloodTypeChanged;
  final Function(String) onRhChanged;

  const BloodType({
    super.key,
    required this.onBloodTypeChanged,
    required this.onRhChanged,
    required this.initialBloodType,
    required this.initialRh,
  });

  @override
  State<BloodType> createState() => _BloodTypeState();
}

class _BloodTypeState extends State<BloodType> {
  late String selectedBloodType;
  late String selectedRh;

  @override
  void initState() {
    super.initState();
    selectedBloodType = widget.initialBloodType;
    selectedRh = widget.initialRh;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${AppStrings.bloodType}  $selectedBloodType$selectedRh",
          style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: _buildBloodCard("O")),
            SizedBox(width: 8.w),
            Expanded(child: _buildBloodCard("A")),
            SizedBox(width: 8.w),
            Expanded(child: _buildBloodCard("B")),
            SizedBox(width: 8.w),
            Expanded(child: _buildBloodCard("AB")),
          ],
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 56.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: _buildButtonRh("+")),
              SizedBox(width: 12.w),
              Expanded(child: _buildButtonRh("-")),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBloodCard(String name) {
    bool isSelected = selectedBloodType == name;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBloodType = name;
        });
        widget.onBloodTypeChanged(name);
      },
      child: Container(
        width: 76,
        height: 80,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.borderAccent : AppColors.borderBlack,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 32.h,
              width: 32.w,
              child: SvgPicture.asset(
                Assets.assetsImagesIconsGeneralDroplet,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.borderBlack : AppColors.borderAccent,
                  BlendMode.srcIn, // أو srcATop
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              name,
              style: AppTextStyles.head3.copyWith(
                color: isSelected
                    ? AppColors.borderBlack
                    : AppColors.borderAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRh(String name) {
    bool isSelected = selectedRh == name;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRh = name;
        });
        widget.onRhChanged(name);
      },
      child: Container(
        width: 76,
        height: 80,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.borderAccent : AppColors.borderBlack,
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.center,
        child: Text(
          "RH $name",
          style: AppTextStyles.head3.copyWith(
            color: isSelected ? AppColors.borderBlack : AppColors.borderAccent,
          ),
        ),
      ),
    );
  }
}
