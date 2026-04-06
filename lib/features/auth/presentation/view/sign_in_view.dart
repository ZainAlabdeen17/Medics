import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/functions/app_navigation.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/auth_state.dart';
import 'package:medics/features/auth/presentation/view/widgets/auth_header.dart';
import 'package:medics/features/auth/presentation/view/widgets/auth_footer.dart';
import 'package:medics/features/auth/presentation/view/widgets/sign_in_form.dart';


class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
      return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
    return Scaffold(
       body: Padding(
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
            SliverToBoxAdapter(child: AuthFooter(text1: AppStrings.areYouNewHere, text2: AppStrings.createAccount, onTap: () {
             AppNavigation.pushReplacementScreen(context, '/SignUp');
            },))
            
           ],
         ),
       ),
    );},
      ),
    );
  }
}
