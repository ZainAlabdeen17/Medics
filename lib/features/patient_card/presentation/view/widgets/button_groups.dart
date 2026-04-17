import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class ButtonGroups extends StatefulWidget {
  const ButtonGroups({super.key});

  @override
  State<ButtonGroups> createState() => _ButtonGroupsState();
}

class _ButtonGroupsState extends State<ButtonGroups> {
  String selectedGroup = "Yes";
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(text: "Yes"),
        SizedBox(width: 12),
        _buildButton(text: "No"),
        SizedBox(width: 12),
        _buildButton(text: "Occasionally" , width: 159),
      ],
    );
  }

  Widget _buildButton({required String text, int width = 0}) {
    String fullLabel = text;
    bool isSelected = selectedGroup == fullLabel;
    return SizedBox(
      width: width == 0 ? 80.w : width.w,
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
