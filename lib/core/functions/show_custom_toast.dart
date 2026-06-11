import 'package:flutter/material.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:toastification/toastification.dart';

void showCustomToast({
  required BuildContext context,
  required String title,
  required Color primaryColor,
  required Icon icon,
  String? descriptionText,
  int? secondsDur,
}) {
  toastification.show(
    context: context,
    title: Text(
      title,
      style: AppTextStyles.body1.copyWith(
        color: AppColors.textSecondary,
        fontSize: 14,
      ),
    ),
    description: descriptionText != null
        ? Text(
            descriptionText,
            style: AppTextStyles.body2.copyWith(color: AppColors.textSecondary),
          )
        : null,
    autoCloseDuration: Duration(seconds: secondsDur ?? 5),
    primaryColor: primaryColor,
    icon: icon,
    alignment: Alignment.topCenter,
    closeButton: ToastCloseButton(showType: CloseButtonShowType.none),
    applyBlurEffect: true,
    borderSide: BorderSide.none,
  );
}
