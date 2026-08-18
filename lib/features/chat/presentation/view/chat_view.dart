import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/features/chat/presentation/widgets/custom_chat_header.dart';
import 'package:medics/features/chat/presentation/widgets/custom_circle_progress_indicator.dart';
import 'package:medics/features/chat/presentation/cubit/chat_cubit/chat_cubit.dart';
import 'package:medics/features/chat/presentation/cubit/chat_cubit/chat_state.dart';
import 'package:medics/features/chat/presentation/widgets/messages_list_builder.dart';
import 'package:medics/features/chat/presentation/widgets/centerlized_text.dart';
import 'package:medics/features/chat/presentation/widgets/text_input_field.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        final chatCubit = context.read<ChatCubit>();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (chatCubit.scrollController.hasClients) {
            chatCubit.scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        });

        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      builder: (context, state) {
        debugPrint('UI MESSAGES COUNT => ${state.messages.length}');
        final messages = state.messages.reversed.toList();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  CustomChatHeader(doctor: widget.doctor),
                  Divider(
                    height: 0.h,
                    color: AppColors.borderPrimary,
                    thickness: 1.w,
                  ),
                  Expanded(
                    child: state.isLoading
                        ? CustomCircleProgressIndicator()
                        : state.messages.isEmpty && state.errorMessage == null
                        ? CenerlizedText(
                            note: "Say Hello To ${widget.doctor.firstName}",
                          )
                        : state.messages.isEmpty && state.errorMessage != null
                        ? CenerlizedText(note: state.errorMessage!)
                        : MessagesListBuilder(
                            messages: messages,
                            sender: widget.doctor.firstName,
                          ),
                  ),
                  TextInputField(receiverId: widget.doctor.userId),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
