import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/on_error_widget.dart';
import 'package:medics/features/conversation/data/models/doctor_thread_model.dart';
import 'package:medics/features/conversation/presentation/cubit/conversation_cubit/conversation_cubit.dart';
import 'package:medics/features/conversation/presentation/cubit/conversation_cubit/conversation_state.dart';
import 'package:medics/features/home/presentation/view/widgets/home_search_field.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ConversationsView extends StatefulWidget {
  const ConversationsView({super.key});

  @override
  State<ConversationsView> createState() => _ConversationsViewState();
}

class _ConversationsViewState extends State<ConversationsView> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('conversations_view_key'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 1.0) {
          context.read<ConversationsCubit>().fetchConversations(
            withoutLoading: true,
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.h),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      AppStrings.messages,
                      style: AppTextStyles.head1.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: HomeSearchField(
                      hintText: AppStrings.searchByName,
                      controller: _searchController,
                    ),
                  ),
                ),
                BlocBuilder<ConversationsCubit, ConversationsState>(
                  builder: (context, state) {
                    if (state is ConversationsLoading) {
                      return const SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.btnPrimary,
                          ),
                        ),
                      );
                    } else if (state is ConversationsError) {
                      return SliverFillRemaining(child: OnErrorWidget());
                    } else if (state is ConversationsLoaded) {
                      final chats = state.conversations.where((conversation) {
                        final doctorFullName =
                            "${conversation.doctor.firstName} ${conversation.doctor.lastName}";
                        return doctorFullName.toLowerCase().contains(
                          _searchQuery,
                        );
                      }).toList();
                      if (chats.isEmpty) {
                        return SliverFillRemaining(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 48.h,
                                  width: 48.w,
                                  child: SvgPicture.asset(
                                    Assets.assetsImagesIconsGeneralSend,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.iconAccent,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Text(
                                  _searchQuery.isEmpty
                                      ? 'No Threads found'
                                      : 'No matching Threads found',
                                  style: AppTextStyles.head2.copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Your Threads will appear here once they are available.',
                                  style: AppTextStyles.body1.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return SliverList.builder(
                        itemCount: chats.length,
                        itemBuilder: (context, index) {
                          final DoctorThreadModel chat = chats[index];

                          return InkWell(
                            onTap: () {
                              context.push('/ChatView', extra: chat.doctor);
                            },
                            child: Container(
                              height: 84.h,
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.borderPrimary,
                                    width: 0.5.w,
                                  ),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.push(
                                        '/DoctorDetails',
                                        extra: {"doctor": chat.doctor},
                                      );
                                    },
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        chat.doctorImage ?? '',
                                      ),
                                      radius: 24,
                                      backgroundColor: AppColors.borderPrimary,
                                      onBackgroundImageError: (_, __) {},
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          chat.doctorName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyles.head3.copyWith(
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                        Text(
                                          chat.lastMessage ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyles.body1.copyWith(
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(width: 8.w),
                                  Text(
                                    _formatTime(chat.lastMessageTime),
                                    style: AppTextStyles.body3.copyWith(
                                      color: AppColors.textSecondary,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }

                    return const SliverToBoxAdapter(child: SizedBox.shrink());
                  },
                ),

                SliverToBoxAdapter(child: SizedBox(height: 104.h)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime(String? timeStr) {
    if (timeStr == null || timeStr.trim().isEmpty) return '';

    final parsedDate =
        DateTime.tryParse(timeStr) ??
        DateTime.tryParse(timeStr.replaceAll(' ', 'T'));

    if (parsedDate != null) {
      final hour = parsedDate.hour.toString().padLeft(2, '0');
      final minute = parsedDate.minute.toString().padLeft(2, '0');
      return "$hour:$minute";
    }

    final parts = timeStr.trim().split(' ');
    if (parts.length >= 2) {
      String timePart = parts[1];

      if (timePart.contains(':')) {
        final timeSegments = timePart.split(':');
        if (timeSegments.length >= 2) {
          timePart =
              '${timeSegments[0].padLeft(2, '0')}:${timeSegments[1].padLeft(2, '0')}';
        }
      }

      if (parts.length > 2 &&
          (parts[2].toUpperCase() == 'AM' || parts[2].toUpperCase() == 'PM')) {
        return '$timePart ${parts[2]}';
      }

      return timePart;
    }

    return timeStr;
  }
}
