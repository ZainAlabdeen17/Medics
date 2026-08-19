import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/FAQ/data/faq_item.dart';
import 'package:medics/features/home/presentation/view/widgets/home_search_field.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredFaqs = faqList.where((item) {
      return item.question.toLowerCase().contains(_searchQuery) ||
          item.answer.toLowerCase().contains(_searchQuery);
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: GeneralHeader(title: "Frequently Asked Questions"),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 12.h)),

              SliverToBoxAdapter(
                child: HomeSearchField(
                  hintText: "Search FAQ...",
                  controller: _searchController,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              if (filteredFaqs.isEmpty)
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Text(
                        'No questions match your search.',
                        style: AppTextStyles.body2.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                )
              else
                SliverList.separated(
                  itemCount: filteredFaqs.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    final faq = filteredFaqs[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.surfaceBlur,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.borderBlack),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: AppColors.iconAccent,
                          collapsedIconColor: AppColors.iconGreyDisabled,
                          tilePadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 4.h,
                          ),
                          title: Text(
                            faq.question,
                            style: AppTextStyles.head3.copyWith(
                              color: AppColors.textAccent,
                            ),
                          ),
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.w,
                                right: 16.w,
                                bottom: 16.h,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  faq.answer,
                                  style: AppTextStyles.body2.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            ],
          ),
        ),
      ),
    );
  }
}
