import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/core/widgets/on_error_widget.dart';
import 'package:medics/features/home/presentation/view/widgets/home_search_field.dart';
import 'package:medics/features/medical_records/presentation/cubit/medical_tests_cubit/medical_tests_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/medical_tests_cubit/medical_tests_state.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/build_lab_report_card.dart';

class LabReport extends StatefulWidget {
  const LabReport({super.key});

  @override
  State<LabReport> createState() => _LabReportState();
}

class _LabReportState extends State<LabReport> {
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
              await context.read<MedicalTestsCubit>().getMedicalTests();
            },
            backgroundColor: AppColors.surfaceCard,
            color: AppColors.borderAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: GeneralHeader(title: AppStrings.labReports),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 8.h)),
                  SliverToBoxAdapter(
                    child: HomeSearchField(
                      hintText: AppStrings.startTypingReportName,
                      controller: _searchController,
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  BlocBuilder<MedicalTestsCubit, MedicalTestsState>(
                    builder: (context, state) {
                      if (state is MedicalTestsLoading) {
                        return SliverFillRemaining(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.borderAccent,
                            ),
                          ),
                        );
                      } else if (state is MedicalTestsError) {
                        return SliverFillRemaining(child: OnErrorWidget());
                      } else if (state is MedicalTestsSuccess) {
                        final filteredList = state.medicalTests.where((test) {
                          return test.name.toLowerCase().contains(_searchQuery);
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
                                      Assets.assetsImagesIconsGeneralMicroscope,
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  Text(
                                    _searchQuery.isEmpty
                                        ? 'No lab reports found'
                                        : 'No matching lab reports found',
                                    style: AppTextStyles.head2.copyWith(
                                      color: AppColors.textPrimary,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    'Your test reports will appear here once they are available.',
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
                            return BuildLabReportCard(
                              medicalTest: filteredList[i],
                            );
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
