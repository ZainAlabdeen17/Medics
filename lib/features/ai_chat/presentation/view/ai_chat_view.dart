import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medics/core/functions/show_custom_toast.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/on_error_widget.dart';
import 'package:medics/features/ai_chat/data/models/message_model.dart';
import 'package:medics/features/ai_chat/presentation/cubit/ai_chat_cubit/ai_chat_cubit.dart';
import 'package:medics/features/ai_chat/presentation/cubit/ai_chat_cubit/ai_chat_state.dart';
import 'package:medics/features/ai_chat/presentation/widgets/ai_chat_header.dart';
import 'package:medics/features/ai_chat/presentation/widgets/ai_input_text_field.dart';
import 'package:medics/features/ai_chat/presentation/widgets/ai_message_list_builder.dart';
import 'package:medics/features/chat/presentation/widgets/custom_circle_progress_indicator.dart';

class AiChatView extends StatefulWidget {
  const AiChatView({super.key});

  @override
  State<AiChatView> createState() => _AiChatViewState();
}

class _AiChatViewState extends State<AiChatView> {
  final ScrollController _scrollController = ScrollController();
  List<MessageModel> _localMessages = [];

  @override
  void initState() {
    super.initState();
    context.read<AiChatCubit>().fetchHistory();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AiChatCubit, AiChatState>(
      listener: (context, state) {
        if (state is AiChatLoaded) {
          setState(() {
            _localMessages = state.messages;
          });
          _scrollToBottom();
        } else if (state is AiChatError) {
          showCustomToast(
            context: context,
            title: "Something happened , please try again",
            primaryColor: AppColors.iconRed,
            icon: Icon(Icons.cancel_outlined, color: AppColors.iconRed),
          );
        }
      },
      builder: (context, state) {
        final bool isTyping = state is AiChatLoaded ? state.isTyping : false;

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  const AiChatHeader(),
                  Divider(
                    height: 0.h,
                    color: AppColors.borderPrimary,
                    thickness: 1.w,
                  ),
                  Expanded(child: _buildBody(state, isTyping)),
                  AiTextInputField(
                    isTyping: isTyping,
                    onSend: (text) {
                      context.read<AiChatCubit>().sendMessage(text);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(AiChatState state, bool isTyping) {
    if (state is AiChatLoading && _localMessages.isEmpty) {
      return const CustomCircleProgressIndicator();
    }

    if (state is AiChatError && _localMessages.isEmpty) {
      return Center(child: OnErrorWidget());
    }

    if (_localMessages.isEmpty && !isTyping) {
      return _buildEmptyState();
    }

    return AiMessagesList(
      messages: _localMessages,
      isTyping: isTyping,
      scrollController: _scrollController,
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              Assets.assetsImagesAnimationMedicalFrontliners,
              width: 180.w,
              height: 180.h,
              animate: true,
              repeat: true,
            ),
            SizedBox(height: 12.h),
            Text(
              "How can I help you today?",
              style: AppTextStyles.head4.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: 6.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "Ask medical questions or get general health guidance.",
                textAlign: TextAlign.center,
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
