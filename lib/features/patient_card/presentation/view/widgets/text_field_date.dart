import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';

class TextFieldDate extends StatelessWidget {
  final String hintText;
  final Function(String)? onDateSelected;

  const TextFieldDate({
    super.key,
    required this.hintText,
    this.onDateSelected,
  });

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
        suffixIcon: const Icon(Icons.calendar_today),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide:
              BorderSide(color: AppColors.borderBlack, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide:
              BorderSide(color: AppColors.borderBlack, width: 1.w),
        ),
      ),
    );
  }

  void showDatePickerBottomSheet(BuildContext context) {
    int selectedDay = 1;
    int selectedMonth = 1;
    int selectedYear = 1980;

    final months = [
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
    ];

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 350,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Text(
                  AppStrings.chooseYourBirthDate,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),

                Expanded(
                  child: Row(
                    children: [
                      /// Day
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 40,
                          onSelectedItemChanged: (index) {
                            selectedDay = index + 1;
                          },
                          childDelegate:
                              ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Center(
                                  child: Text("${index + 1}"));
                            },
                            childCount: 31,
                          ),
                        ),
                      ),

                      /// Month
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 40,
                          onSelectedItemChanged: (index) {
                            selectedMonth = index + 1;
                          },
                          childDelegate:
                              ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Center(
                                  child: Text(months[index]));
                            },
                            childCount: months.length,
                          ),
                        ),
                      ),

                      /// Year
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 40,
                          onSelectedItemChanged: (index) {
                            selectedYear = 1980 + index;
                          },
                          childDelegate:
                              ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Center(
                                  child: Text("${1980 + index}"));
                            },
                            childCount: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                /// Save
                ElevatedButton(
                  onPressed: () {
                    String date =
                        "$selectedDay ${months[selectedMonth - 1]} $selectedYear";

                    /// send value
                    onDateSelected?.call(date);

                    Navigator.pop(context);
                  },
                  child: const Text("Save date"),
                ),

                /// Cancel
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}