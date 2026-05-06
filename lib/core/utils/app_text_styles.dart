import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  AppTextStyles._();
  static const String fontFamily = "Syne";

  //
  static final TextStyle head = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 64.sp,
    height: 40 / 64,
  );
  static final TextStyle head1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 28.sp,
    height: 40 / 28,
  );
  static final TextStyle head2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
    height: 28 / 20,
  );
  static final TextStyle head3 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    height: 24 / 16,
  );
  static final TextStyle head4 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    height: 20 / 14,
  );
  static final TextStyle headOtp = TextStyle(
    fontFamily: "Times New Roman",
    fontWeight: FontWeight.w400,
    fontSize: 24.sp,
  );
  //
  static final TextStyle body1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    height: 24 / 16,
  );
  static final TextStyle body2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    height: 20 / 14,
  );
  static final TextStyle body3 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    height: 18 / 12,
  );
  //
  static final TextStyle list1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    height: 20 / 14,
  );
  //
  static final TextStyle link1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    height: 20 / 14,
  );
  static final TextStyle num1 = TextStyle(
    fontFamily: "Inter",
    fontWeight: FontWeight.w800,
    fontSize: 14.sp,
    height: 24 / 16,
  );
  static final TextStyle num2 = TextStyle(
    fontFamily: "Inter",
    fontWeight: FontWeight.w800,
    fontSize: 16.sp,
    height: 24 / 16,
  );
}
