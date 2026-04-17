import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/functions/app_navigation.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/widgets/button_class.dart';
import 'package:medics/core/widgets/custom_fill_button.dart';
import 'package:medics/features/on_boarding/presentation/cubit/on_boaarding_cubit.dart';
import 'package:medics/features/on_boarding/presentation/cubit/on_boarding_state.dart';

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoaardingCubit, OnBoardingState>(
      builder: (context, state) {
        if (state is NextButtonState) {
          return CustomFillButton(
            text: AppStrings.next,
            onPressed: () => controller.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
            ),
          );
        } else if (state is GetStartedButtonState) {
          return CustomFillButton(
            text: AppStrings.getStarted,
            onPressed: () => controller.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
            ),
          );
        } else {
          return Column(
            children: [
              ButtonClass.customFillButton(
                text: AppStrings.createAnAccount,
                onPressed: () {
                  AppNavigation.pushReplacementScreen(context, '/SignUp');
                },
              ),
              SizedBox(height: 8.h),
              ButtonClass.customNonFillButton(
                 text: AppStrings.login,
                onPressed: () {
                  AppNavigation.pushReplacementScreen(context, '/SignIn');
                },
              ),
              SizedBox(height: 20.h),
            ],
          );
        }
      },
    );
  }
}
