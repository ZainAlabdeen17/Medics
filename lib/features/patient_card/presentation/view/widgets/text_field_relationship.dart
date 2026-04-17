import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/button_class.dart';

class TextFieldRelationship extends StatefulWidget {
  final String hintText;

  const TextFieldRelationship({super.key, required this.hintText});

  @override
  State<TextFieldRelationship> createState() => _TextFieldRelationshipState();
}

class _TextFieldRelationshipState extends State<TextFieldRelationship> {
  String selectedRelationship = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () {
        showRelationshipBottomSheet(context);
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: AppColors.surfaceBlur,
        suffixIcon: Icon(Icons.arrow_drop_down),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: AppColors.borderBlack, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: AppColors.borderBlack, width: 1.w),
        ),
      ),
    );
  } 

  void showRelationshipBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 380.h,
              width: 375.w,
              padding: EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      "Select your relationship",
                      style: AppTextStyles.head3.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  _buildRelationshipOption(AppStrings.spouse, setModalState),

                  _buildRelationshipOption(AppStrings.parent, setModalState),

                  _buildRelationshipOption(AppStrings.child, setModalState),

                  _buildRelationshipOption(AppStrings.friend, setModalState),

                  _buildRelationshipOption(AppStrings.other, setModalState),
                 SizedBox(height: 12.h),
                  ButtonClass.customFillButton(
                    text: AppStrings.save,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildRelationshipOption(String text, StateSetter setModalState) {
    bool isSelected = selectedRelationship == text;
    return ListTile(
      title: Text(
        text,
        style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
      ),
      trailing: isSelected
          ? Icon(Icons.check, color: AppColors.textPrimary)
          : null,

      onTap: () {
        setModalState(() {
          selectedRelationship = text;
        });
      },
    );
  }
}
