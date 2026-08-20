// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class AiTextInputField extends StatefulWidget {
  const AiTextInputField({
    super.key,
    required this.isTyping,
    required this.onSend,
  });

  final bool isTyping;
  final ValueChanged<String> onSend;

  @override
  State<AiTextInputField> createState() => _AiTextInputFieldState();
}

class _AiTextInputFieldState extends State<AiTextInputField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isEmpty || widget.isTyping) return;

    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0.h),
      child: TextField(
        controller: _controller,
        enabled: !widget.isTyping,
        minLines: 1,
        maxLines: 3,
        keyboardType: TextInputType.multiline,
        onSubmitted: (_) => _handleSend(),
        decoration: InputDecoration(
          hintText: widget.isTyping
              ? 'Medics AI is typing...'
              : 'Type your medical question...',
          hintStyle: AppTextStyles.body1.copyWith(
            color: AppColors.textSecondary,
          ),
          filled: true,
          fillColor: AppColors.surfaceBlur,
          suffixIcon: ValueListenableBuilder<TextEditingValue>(
            valueListenable: _controller,
            builder: (context, value, _) {
              final hasText = value.text.trim().isNotEmpty;
              final canSend = hasText && !widget.isTyping;

              return GestureDetector(
                onTap: canSend ? _handleSend : null,
                child: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: canSend
                          ? AppColors.surfaceAccent
                          : AppColors.iconGreyDisabled,
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: SvgPicture.asset(
                          Assets.assetsImagesIconsGeneralMessageSend,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: 32.w,
            minHeight: 32.h,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 16.w,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: AppColors.borderAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: AppColors.borderBlack),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(
              color: AppColors.borderBlack.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
