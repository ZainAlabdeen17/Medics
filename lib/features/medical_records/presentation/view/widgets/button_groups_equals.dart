import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class ButtonGroupsEquals extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  final Function(String) onSelected;
  const ButtonGroupsEquals({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
   required this.onSelected,
  });

  @override
  State<ButtonGroupsEquals> createState() => _ButtonGroupsState();
}

class _ButtonGroupsState extends State<ButtonGroupsEquals> {
  late String selectedGroup;
  @override
  void initState() {
    super.initState();
    selectedGroup = widget.text1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: _buildButton(text: widget.text1)),
        SizedBox(width: 12),
        Expanded(child: _buildButton(text: widget.text2)),
        SizedBox(width: 12),
        Expanded(child: _buildButton(text: widget.text3, width: 159)),
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
          widget.onSelected(text);
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
