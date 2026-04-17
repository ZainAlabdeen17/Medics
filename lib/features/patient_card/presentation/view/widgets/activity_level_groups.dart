import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class ActivityLevelGroups extends StatefulWidget {
  const ActivityLevelGroups({super.key});

  @override
  State<ActivityLevelGroups> createState() => _ActivityLevelGroupsState();
}

class _ActivityLevelGroupsState extends State<ActivityLevelGroups> {
  String selectedGroup = AppStrings.activityLevel1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildButton(text: AppStrings.activityLevel1),
        SizedBox(height: 12.h),
        _buildButton(text: AppStrings.activityLevel2),
        SizedBox(height: 12.h),
        _buildButton(text: AppStrings.activityLevel3),
      ],
    );
  }

  Widget _buildButton({required String text, int width = 0}) {
    String fullLabel = text;
    bool isSelected = selectedGroup == fullLabel;
    return SizedBox(
      width: width == 0 ? double.infinity : width.w,
      height: 48.h,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedGroup = fullLabel;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? AppColors.borderAccent
              : AppColors.borderBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.head3.copyWith(
            color: isSelected ? AppColors.borderBlack : AppColors.borderAccent,
          ),
        ),
      ),
    );
  }
}
