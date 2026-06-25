import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/core/services/service_locator.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/buttom_button.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/custom_tab_bar.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/custom_tab_bar_view_widget.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/doctor_details_badge.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/doctor_details_header.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BookCubit()),
        BlocProvider(create: (context) => getIt<DoctorCubit>()..getDays(doctorId: doctor.id)),
      ],
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
