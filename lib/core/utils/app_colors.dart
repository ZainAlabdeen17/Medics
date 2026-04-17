import 'package:flutter/material.dart';
import 'package:medics/core/utils/app_palette.dart';

class AppColors {
  AppColors._();
  // --- Text Colors ---
  static const Color scaffoldColor = Color(0xffecf3f3);
  static const Color textAccent = AppPalette.primary600;
  static const Color textPrimary = AppPalette.grey900;
  static const Color textSecondary = AppPalette.grey600;
  static const Color textDisabled = AppPalette.grey300;
  static const Color textStaticBlack = AppPalette.grey900;
  static const Color textStaticWhite = AppPalette.white;
  static const Color textGreen = AppPalette.success500;
  static const Color textRed = AppPalette.danger500;
  static const Color textOrange = AppPalette.warning500;

  // --- Surface Colors ---
  static const Color surfaceAccent = AppPalette.primary600;
  static const Color surfaceAccentLight = AppPalette.primary100;
  static const Color surfacePrimary = AppPalette.grey100;
  static const Color surfaceCard = AppPalette.white;
  static const Color surfaceBlue = AppPalette.gradient100;
  static const Color surfaceOrange = AppPalette.warning100;
  static const Color surfaceGreen = AppPalette.success100;
  static const Color surfaceRed = AppPalette.danger100;
  // ignore: deprecated_member_use
  static Color surfaceBlur = Colors.white.withOpacity(0.5); // White-transparent

  // --- Border Colors ---
  static const Color borderAccent = AppPalette.primary600;
  static const Color borderPrimary = AppPalette.grey200;
  static const Color borderSecondary = AppPalette.grey400;
  static const Color borderBlack = AppPalette.white; //
  static const Color borderRed = AppPalette.danger500;
  static const Color borderOrange = AppPalette.warning500;
  static const Color borderGreen = AppPalette.success500;

  // --- Buttons ---
  static const Color btnPrimary = AppPalette.primary600;
  static const Color btnSecondary = AppPalette.grey50;
  static const Color btnDisabled = AppPalette.grey200;
  static const Color btnRed = AppPalette.danger500;

  // --- Icons ---
  static const Color iconAccent = AppPalette.primary600;
  static const Color iconRed = AppPalette.danger500;
  static const Color iconOrange = AppPalette.warning500;
  static const Color iconGreen = AppPalette.success500;
  static const Color iconGrey = AppPalette.grey600;
  static const Color iconGreyDisabled = AppPalette.grey200;
  static const Color iconStaticWhite = AppPalette.white;
}
