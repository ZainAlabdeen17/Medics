import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/on_boarding/data/on_boarding_item_model.dart';
import 'package:medics/features/on_boarding/presentation/cubit/on_boaarding_cubit.dart';
import 'package:medics/features/on_boarding/presentation/view/widgets/custom_page_indicator.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 565.h,
      child: PageView.builder(
        controller: controller,
        itemCount: listOnBoardingItem.length,
        onPageChanged: (value) {
          BlocProvider.of<OnBoaardingCubit>(context).getButtons(index: value);
        },
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 344.w,
                height: 344.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(listOnBoardingItem[index].image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              CustomPageIndicator(controller: controller),
              SizedBox(height: 32.h),
              Text(
                listOnBoardingItem[index].title,
                style: AppTextStyles.head1.copyWith(
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.h),
              Text(
                listOnBoardingItem[index].subTitle,
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 6,
              ),
            ],
          );
        },
      ),
    );
  }
}
