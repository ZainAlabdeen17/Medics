import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/rate_chip.dart';
import 'package:shimmer/shimmer.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          "/DoctorDetails",
          extra: {
            'doctor': doctor,
            'doctor_cubit': context.read<DoctorCubit>(),
          },
        );
      },
      child: Stack(
        alignment: Alignment(0, 1.2),
        children: [
          Container(
            // height: 241.h,
            // width: 166.w,
            padding: EdgeInsets.symmetric(horizontal: 12.5.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.surfaceBlur,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: AppColors.borderBlack, width: 1.w),
            ),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      width: 141.w,
                      height: 141.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: doctor.photoUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          Assets.assetsImagesDoctorsDoctor5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
                      child: Material(
                        color: Colors.transparent,
                        child: RateChip(rating: doctor.rating.toDouble()),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Material(
                  color: Colors.transparent,
                  child: Text(
                    "${doctor.firstName} ${doctor.lastName}",
                    style: AppTextStyles.head3.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  doctor.specialization,
                  style: AppTextStyles.body2.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.push("/DoctorDetails", extra: doctor);
            },
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
                  child: SvgPicture.asset(Assets.assetsImagesIconsGeneralArrow),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
