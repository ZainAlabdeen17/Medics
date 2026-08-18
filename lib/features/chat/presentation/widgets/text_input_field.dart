import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/chat/presentation/cubit/chat_cubit/chat_cubit.dart';
import 'package:medics/features/chat/presentation/cubit/input_cubit/input_cubit.dart';
import 'package:medics/features/chat/presentation/widgets/send_button.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({super.key, required this.receiverId});
  final int receiverId;

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.read<ChatCubit>();
    final inputCubit = context.read<InputCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0.h),
      child: TextField(
        //
        onChanged: (value) {
          inputCubit.updateInput(value);
        },
        //
        controller: chatCubit.inputController,
        //
        minLines: 1,
        maxLines: 2,
        keyboardType: TextInputType.multiline,
        //
        decoration: InputDecoration(
          //
          hintText: 'Type your message...',
          hintStyle: AppTextStyles.body1.copyWith(
            color: AppColors.textSecondary,
          ),
          //
          filled: true,
          fillColor: AppColors.surfaceBlur,
          //
          suffixIcon: SendButton(receiverId: receiverId),
          suffixIconConstraints: BoxConstraints(
            minWidth: 32.w,
            minHeight: 32.h,
          ),
          //
          contentPadding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 16.w,
          ),
          //
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: AppColors.borderAccent),
          ),
          //
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: AppColors.borderBlack),
          ),
          //
        ),
      ),
    );
  }
}
