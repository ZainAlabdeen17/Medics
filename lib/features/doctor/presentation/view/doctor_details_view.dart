import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/features/doctor/data/doctor_tryal_model.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/buttom_button.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/custom_tab_bar.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/custom_tab_bar_view_widget.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/doctor_details_badge.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/doctor_details_header.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key, required this.doctor});
  final DoctorTrialModel doctor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookCubit(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: BottomBotton(),
          body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(child: DoctorDetailsHeader()),
                  SliverToBoxAdapter(child: DoctorDetailsBadge(doctor: doctor)),
                  SliverAppBar(
                    pinned: true,
                    surfaceTintColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColors.scaffoldColor,
                    elevation: 0,
                    title: CustomTabBar(),
                  ),
                ];
              },
              body: CustomTabBarView(doctor: doctor),
            ),
          ),
        ),
      ),
    );
  }
}
