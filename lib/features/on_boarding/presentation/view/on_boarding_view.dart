import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/features/on_boarding/presentation/cubit/on_boaarding_cubit.dart';
import 'package:medics/features/on_boarding/presentation/view/widgets/on_boarding_body.dart';
import 'package:medics/features/on_boarding/presentation/view/widgets/on_boarding_buttons.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoaardingCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 80.h)),
              SliverToBoxAdapter(
                child: OnBoardingBody(controller: _controller),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 32.h)),
              SliverToBoxAdapter(
                child: OnBoardingButtons(controller: _controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
