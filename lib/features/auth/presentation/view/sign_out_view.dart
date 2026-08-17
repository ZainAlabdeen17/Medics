import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/auth/presentation/cubit/logout_cubit/logout_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/logout_cubit/logout_state.dart';

class SignOutView extends StatefulWidget {
  const SignOutView({super.key});

  @override
  State<SignOutView> createState() => _SignOutViewState();
}

class _SignOutViewState extends State<SignOutView> {
  @override
  void initState() {
    super.initState();
    context.read<LogoutCubit>().logout();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          context.pushReplacement('/SignIn');
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  Assets.assetsImagesAnimationMedicalFrontliners,
                  repeat: true,
                  animate: true,
                  width: 300.w,
                  height: 300.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20.h),
                Text(
                  'Logging out...',
                  style: AppTextStyles.head3.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: 22.w,
                  height: 22.h,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.btnPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
