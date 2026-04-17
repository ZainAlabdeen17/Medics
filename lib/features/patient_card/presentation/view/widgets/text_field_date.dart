import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';

class TextFieldDate extends StatelessWidget {
  final String hintText;
  const TextFieldDate({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,

      onTap: () {
        showDatePickerBottomSheet(context);
      },
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.borderBlack,
        suffixIcon: Icon(Icons.calendar_today),

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

  void showDatePickerBottomSheet(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 350,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 8),
                Text(
                  AppStrings.chooseYourBirthDate,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 40,
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Center(child: Text("${index + 1}"));
                            },
                            childCount: 31,
                          ),
                        ),
                      ),

                      Expanded(
                        child: ListWheelScrollView(
                          itemExtent: 40,
                          children: [
                            "January",
                            "February",
                            "March",
                            "April",
                            "May",
                            "June",
                            "July",
                            "August",
                            "September",
                            "October",
                            "November",
                            "December",
                          ].map((e) => Center(child: Text(e))).toList(),
                        ),
                      ),

                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 40,
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Center(child: Text("${1980 + index}"));
                            },
                            childCount: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Save date"),
                ),

                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
