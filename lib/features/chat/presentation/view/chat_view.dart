import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/chat/data/chat_model.dart';
import 'package:medics/features/home/presentation/view/widgets/home_search_field.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final recentChats = ChatModel.getRecentChats();
    return Scaffold(
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
                  child: HomeSearchField(hintText: AppStrings.searchByName),
                ),
              ),
              SliverList.builder(
                itemCount: recentChats.length,
                itemBuilder: (context, index) {
                  final chat = recentChats[index];
                  return Container(
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
                        CircleAvatar(
                          backgroundImage: AssetImage(chat['image']),
                          radius: 24,
                          backgroundColor: AppColors.borderPrimary,
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chat['name'],
                              style: AppTextStyles.head3.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(
                              width: 223.w,
                              child: Text(
                                chat['lastMessage'],
                                style: AppTextStyles.body1.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          chat['time'],
                          style: AppTextStyles.body3.copyWith(
                            color: AppColors.textSecondary,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(child: SizedBox(height: 104.h)),
            ],
          ),
        ),
      ),
    );
  }
}
