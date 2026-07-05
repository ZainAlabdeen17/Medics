import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_state.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.push(
              '/Filter',
              extra: {
                'filterCubit': context.read<FilterCubit>(),
                'doctorCubit': context.read<DoctorCubit>(),
              },
            );
          },
          child: Stack(
            alignment: Alignment(0.9, -0.9),
            children: [
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.surfaceBlur,
                  border: Border.all(color: AppColors.borderBlack, width: 1.w),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.assetsImagesIconsGeneralFilter,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),

              state.hasFilter == true
                  ? Container(
                      width: 14.w,
                      height: 14.h,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceAccent,
                        shape: BoxShape.circle,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
