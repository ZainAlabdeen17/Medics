import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/functions/app_navigation.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/auth_state.dart';
import 'package:medics/features/auth/presentation/view/widgets/auth_footer.dart';
import 'package:medics/features/auth/presentation/view/widgets/sign_up_form.dart';
import 'package:medics/features/auth/presentation/view/widgets/auth_header.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: AuthHeader(
                        text1: AppStrings.medics,
                        text2: AppStrings.createAnAccount,
                        text3: AppStrings.excited,
                      ),
                    ),
                    SliverToBoxAdapter(child: SignUpForm()),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: state.password.isNotEmpty ? 210.h : 282.h,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: AuthFooter(
                        text1: AppStrings.alreadyHaveAccount,
                        text2: AppStrings.login,
                        onTap: () {
                          AppNavigation.pushReplacementScreen(
                            context,
                            '/SignIn',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
