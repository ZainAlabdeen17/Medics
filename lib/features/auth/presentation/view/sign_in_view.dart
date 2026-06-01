import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/functions/app_navigation.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/auth/presentation/widgets/auth_header.dart';
import 'package:medics/features/auth/presentation/widgets/auth_footer.dart';
import 'package:medics/features/auth/presentation/widgets/sign_in_form.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AuthHeader(
                  text1: AppStrings.medics,
                  text2: AppStrings.login,
                  text3: AppStrings.niceToHaveYou,
                ),
              ),
              SliverToBoxAdapter(child: SignInForm()),
              SliverToBoxAdapter(child: SizedBox(height: 282.h)),
              SliverToBoxAdapter(
                child: AuthFooter(
                  text1: AppStrings.areYouNewHere,
                  text2: AppStrings.createAccount,
                  onTap: () {
                    AppNavigation.pushReplacementScreen(context, '/SignUp');
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
