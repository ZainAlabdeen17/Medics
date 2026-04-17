import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class BloodType extends StatefulWidget {
  const BloodType({super.key});

  @override
  State<BloodType> createState() => _BloodTypeState();
}

class _BloodTypeState extends State<BloodType> {
  String selectedGroup1 = "B(III)";
  String selectedGroup2 = "RH+";
  String typeBlood = "";
  String typeRH = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${AppStrings.bloodType}  $typeBlood$typeRH",
          style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBloodCard("O(I)"),
            SizedBox(width: 12.w),
            _buildBloodCard("A(II)"),
            SizedBox(width: 12.w),
            _buildBloodCard("B(III)"),
            SizedBox(width: 12.w),
            _buildBloodCard("AB(IV)"),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButtonRh("+"),
            SizedBox(width: 12.w),
            _buildButtonRh("-"),
          ],
        ),
      ],
    );
  }

  Widget _buildBloodCard(String name) {
    String fullLabel = name;
    bool isSelected = selectedGroup1 == fullLabel;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGroup1 = fullLabel;
          typeBlood = fullLabel;
        });
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
            Icon(
              Icons.water_drop_outlined,
              color: isSelected
                  ? AppColors.borderBlack
                  : AppColors.borderAccent,
              size: 32,
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
    String fullLabel = name;
    bool isSelected = selectedGroup2 == fullLabel;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGroup2 = fullLabel;
          typeRH = fullLabel;
        });
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
            Icon(
              Icons.water_drop_outlined,
              color: isSelected
                  ? AppColors.borderBlack
                  : AppColors.borderAccent,
              size: 32,
            ),
             SizedBox(height: 8.h),
            Text(
              "RH$name",
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
}
