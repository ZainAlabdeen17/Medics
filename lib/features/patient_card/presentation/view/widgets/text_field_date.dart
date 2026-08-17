import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class TextFieldDate extends StatefulWidget {
  final String hintText;
  final Function(String)? onDateSelected;
  final String? initialDate;

  const TextFieldDate({
    super.key,
    required this.hintText,
    this.onDateSelected,
    this.initialDate,
  });

  @override
  State<TextFieldDate> createState() => _TextFieldDateState();
}

class _TextFieldDateState extends State<TextFieldDate> {
  late final TextEditingController _controller;

  int selectedDay = 1;
  int selectedMonth = 1;
  int selectedYear = 1980;

  final months = [
    "-01-",
    "-02-",
    "-03-",
    "-04-",
    "-05-",
    "-06-",
    "-07-",
    "-08-",
    "-09-",
    "-10-",
    "-11-",
    "-12-",
  ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialDate);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      readOnly: true,
      onTap: () {
        showDatePickerBottomSheet(context);
      },
      style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.body1.copyWith(color: AppColors.textSecondary),
        filled: true,
        fillColor: AppColors.surfaceBlur,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 20, left: 5),
          child: SizedBox(
            width: 24.w,
            height: 24.h,
            child: SvgPicture.asset(Assets.assetsImagesAppointmentsCalendar),
          ),
        ),
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
    int tempDay = selectedDay;
    int tempMonth = selectedMonth;
    int tempYear = selectedYear;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              backgroundColor: AppColors.scaffoldColor,
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
                      style: AppTextStyles.head3.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          /// Day
                          Expanded(
                            child: ListWheelScrollView.useDelegate(
                              itemExtent: 40,
                              controller: FixedExtentScrollController(
                                initialItem: tempDay - 1,
                              ),
                              onSelectedItemChanged: (index) {
                                setDialogState(() {
                                  tempDay = index + 1;
                                });
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  final bool isSelected =
                                      (index + 1) == tempDay;
                                  return Center(
                                    child: Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: isSelected ? 18 : 14,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected
                                            ? AppColors.textPrimary
                                            : Colors.grey,
                                      ),
                                    ),
                                  );
                                },
                                childCount: 31,
                              ),
                            ),
                          ),

                          /// Month
                          Expanded(
                            child: ListWheelScrollView.useDelegate(
                              itemExtent: 40,
                              controller: FixedExtentScrollController(
                                initialItem: tempMonth - 1,
                              ),
                              onSelectedItemChanged: (index) {
                                setDialogState(() {
                                  tempMonth = index + 1;
                                });
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  final bool isSelected =
                                      (index + 1) == tempMonth;
                                  return Center(
                                    child: Text(
                                      months[index],
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: isSelected ? 18 : 14,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected
                                            ? AppColors.textPrimary
                                            : Colors.grey,
                                      ),
                                    ),
                                  );
                                },
                                childCount: months.length,
                              ),
                            ),
                          ),

                          /// Year
                          Expanded(
                            child: ListWheelScrollView.useDelegate(
                              itemExtent: 40,
                              controller: FixedExtentScrollController(
                                initialItem: tempYear - 1980,
                              ),
                              onSelectedItemChanged: (index) {
                                setDialogState(() {
                                  tempYear = 1980 + index;
                                });
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  final bool isSelected =
                                      (1980 + index) == tempYear;
                                  return Center(
                                    child: Text(
                                      "${1980 + index}",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: isSelected ? 18 : 14,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected
                                            ? AppColors.textPrimary
                                            : Colors.grey,
                                      ),
                                    ),
                                  );
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
                        final String date =
                            "$tempYear${months[tempMonth - 1]}$tempDay";

                        setState(() {
                          selectedDay = tempDay;
                          selectedMonth = tempMonth;
                          selectedYear = tempYear;
                          _controller.text = date;
                        });

                        widget.onDateSelected?.call(date);

                        Navigator.pop(context);
                      },
                      child: Text(
                        "Save date",
                        style: AppTextStyles.body3.copyWith(
                          color: AppColors.textAccent,
                        ),
                      ),
                    ),

                    /// Cancel
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: AppTextStyles.body3.copyWith(
                          color: AppColors.textAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
