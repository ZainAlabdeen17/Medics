import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medics/core/utils/app_colors.dart';

class TextFieldPhoneNumber extends StatelessWidget {
  final String hintText;
  const TextFieldPhoneNumber({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      keyboardType: TextInputType.phone,
      
     
      dropdownIconPosition: IconPosition.trailing,
      initialCountryCode: 'US', 
      
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.textDisabled),
        filled: true,
        fillColor: AppColors.borderBlack,
        suffixIcon: Icon(Icons.close, size: 20.sp, color: AppColors.textDisabled ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: AppColors.borderBlack, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: AppColors.borderBlack, width: 1.w),
        ),
        
     
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      
     
      onChanged: (phone) {
       
      },
    );
  }
}