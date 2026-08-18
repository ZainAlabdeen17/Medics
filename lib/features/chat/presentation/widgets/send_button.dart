import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/features/chat/presentation/cubit/chat_cubit/chat_cubit.dart';
import 'package:medics/features/chat/presentation/cubit/input_cubit/input_cubit.dart';
import 'package:medics/features/chat/presentation/cubit/input_cubit/input_state.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key, required this.receiverId});
  final int receiverId;

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.read<ChatCubit>();
    return BlocBuilder<InputCubit, InputState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (chatCubit.inputController.text.trim().isEmpty) {
              return;
            }
            chatCubit.sendMessage(
              receiverId: receiverId,
              body: context.read<ChatCubit>().inputController.text,
            );
            chatCubit.inputController.clear();
          },
          child: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: chatCubit.inputController.text.trim().isNotEmpty
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
    );
  }
}
