import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/core/widgets/on_error_widget.dart';
import 'package:medics/features/home/presentation/view/widgets/home_search_field.dart';
import 'package:medics/features/medical_records/data/models/visit_model.dart';
import 'package:medics/features/medical_records/presentation/cubit/visits_cubit/visits_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/visits_cubit/visits_state.dart';

class VisitSummeries extends StatefulWidget {
  const VisitSummeries({super.key});

  @override
  State<VisitSummeries> createState() => _VisitSummeriesState();
}

class _VisitSummeriesState extends State<VisitSummeries> {
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await context.read<VisitsCubit>().getVisits();
            },
            backgroundColor: AppColors.surfaceCard,
            color: AppColors.borderAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: GeneralHeader(title: AppStrings.visitSummeries),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 8.h)),
                  SliverToBoxAdapter(
                    child: HomeSearchField(
                      hintText: AppStrings.startTypingDoctorName,
                      controller: _searchController,
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  BlocBuilder<VisitsCubit, VisitsState>(
                    builder: (context, state) {
                      if (state is VisitsLoading) {
                        return SliverFillRemaining(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.borderAccent,
                            ),
                          ),
                        );
                      } else if (state is VisitsError) {
                        return SliverFillRemaining(child: OnErrorWidget());
                      } else if (state is VisitsSuccess) {
                        final filteredList = state.visits.where((visit) {
                          return visit.doctorName.toLowerCase().contains(
                            _searchQuery,
                          );
                        }).toList();
                        if (filteredList.isEmpty) {
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
                                      Assets.assetsImagesIconsGeneralNote,
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  Text(
                                    _searchQuery.isEmpty
                                        ? 'No visits summeries found'
                                        : 'No matching visit summeries found',
                                    style: AppTextStyles.head2.copyWith(
                                      color: AppColors.textPrimary,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    'Your visits summaries will appear here once they are available.',
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
                        return SliverList.separated(
                          itemCount: filteredList.length,
                          itemBuilder: (context, i) {
                            return VisitSummaryCard(visit: filteredList[i]);
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 12.h),
                        );
                      }
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    },
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VisitSummaryCard extends StatelessWidget {
  final VisitModel visit;
  const VisitSummaryCard({super.key, required this.visit});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMMM yyyy').format(visit.visitDate);
    return GestureDetector(
      onTap: () => context.push('/VisitSummaryDetails', extra: visit),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 152.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.surfaceBlur,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppColors.borderBlack),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 22.r,
                backgroundImage: CachedNetworkImageProvider(
                  visit.doctorPhotoUrl,
                ),
                backgroundColor: AppColors.borderPrimary,
              ),

              title: Text(
                visit.doctorName,
                style: AppTextStyles.head3.copyWith(
                  color: AppColors.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                visit.doctorSpecialization,
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: SvgPicture.asset(
                            Assets.assetsImagesAppointmentsCalendar,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          formattedDate,
                          style: AppTextStyles.body2.copyWith(
                            color: AppColors.textSecondary,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: SvgPicture.asset(
                            Assets.assetsImagesIconsAboutDoctorHospital,
                            colorFilter: ColorFilter.mode(
                              AppColors.iconAccent,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "In-person visit",
                          style: AppTextStyles.body2.copyWith(
                            color: AppColors.textSecondary,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          Assets.assetsImagesIconsGeneralArrow,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
