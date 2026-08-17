import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/specialization/presentation/cubit/specialization_cubit/specialization_cubit.dart';
import 'package:medics/features/specialization/presentation/cubit/specialization_cubit/specialization_state.dart';
import 'package:medics/features/specialization/presentation/view/widget/specialization_item.dart';

class SpecializationsView extends StatelessWidget {
  const SpecializationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.h, right: 16, bottom: 10.h),
          child: Column(
            children: [
              GeneralHeader(title: AppStrings.specializations),
              SizedBox(height: 16.h),
              Expanded(
                child: BlocBuilder<SpecializationCubit, SpecializationState>(
                  builder: (context, state) {
                    return state is SpecializationLoading
                        ? ListView.separated(
                            itemCount: 8,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 12.h),
                            itemBuilder: (context, index) {
                              return SpecializationItem.skeleton();
                            },
                          )
                        : state is SpecializationFailure
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 48.w,
                                  height: 48.h,
                                  child: SvgPicture.asset(
                                    Assets.assetsImagesIconsGeneralAttention,
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  "Something happened, please try again later.",
                                  style: AppTextStyles.body1.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : state is SpecializationSuccess
                        ? state.specializations.isEmpty
                              ? Center(
                                  child: Text(
                                    "There is no specializations available",
                                    style: AppTextStyles.body2.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    return SpecializationItem(
                                      specializationName: state
                                          .specializations[index]
                                          .specialization,
                                      icon: state.specializations[index].icon,
                                      doctorsCount: state
                                          .specializations[index]
                                          .doctorsCount,
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 8.h),
                                  itemCount: state.specializations.length,
                                )
                        : SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
