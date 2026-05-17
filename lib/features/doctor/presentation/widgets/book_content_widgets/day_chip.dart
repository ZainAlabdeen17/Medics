import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class DayChip extends StatelessWidget {
  const DayChip({
    super.key,
    required this.month,
    required this.day,
    required this.weekDay,
    required this.isSelected,
    required this.onTap,
  });
  final String month;
  final int day;
  final String weekDay;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.r),
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        duration: Duration(milliseconds: 200),
        width: 60.w,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: isSelected ? AppColors.borderAccent : AppColors.borderBlack,
            width: 1.w,
          ),
          color: isSelected ? AppColors.surfaceAccent : AppColors.surfaceBlur,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              month,
              style: AppTextStyles.body2.copyWith(
                color: isSelected
                    ? AppColors.textStaticWhite
                    : AppColors.textSecondary,
              ),
            ),

            SizedBox(height: 6),

            Text(
              "$day",
              style: AppTextStyles.num2.copyWith(
                fontWeight: FontWeight.w700,
                color: isSelected
                    ? AppColors.textStaticWhite
                    : AppColors.textPrimary,
              ),
              // style: AppTextStyles.body1.copyWith(
              // color: isSelected
              //     ? AppColors.textStaticWhite
              //     : AppColors.textSecondary,
              // ),
            ),

            SizedBox(height: 4),

            Text(
              weekDay,
              style: AppTextStyles.body2.copyWith(
                color: isSelected
                    ? AppColors.textStaticWhite
                    : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Container(
//       width: 60.w,
//       height: 76.h,
//       decoration: BoxDecoration(
//         color: AppColors.surfaceBlur,
//         borderRadius: BorderRadius.circular(12.r),
//         border: Border.all(color: AppColors.borderBlack, width: 1.w),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "Apr",
//             style: AppTextStyles.body2.copyWith(color: AppColors.textSecondary),
//           ),

//           SizedBox(height: 6),

//           Text(
//             "10",
//             style: AppTextStyles.head2.copyWith(
//               fontFamily: "Inter",
//               color: AppColors.textPrimary,
//               fontWeight: FontWeight.w900,
//             ),
//           ),
//         ],
//       ),
//     );
