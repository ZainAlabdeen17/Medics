import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/functions/show_custom_toast.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_state.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/buttom_button.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/custom_tab_bar.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/custom_tab_bar_view_widget.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/doctor_details_badge.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/doctor_details_header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocConsumer<BookCubit, BookState>(
        listener: (context, state) {
          if (state.successAppointmentData != null) {
            final appointment = state.successAppointmentData;
            context.pushReplacement(
              '/AppointmentDetails',
              extra: {'appointment': appointment},
            );
          }
          if (state.bookingErrorMessage != null) {
            final message = state.bookingErrorMessage!;
            showCustomToast(
              context: context,
              title: message,
              primaryColor: AppColors.textRed,
              icon: Icon(Icons.cancel_outlined, color: AppColors.iconRed),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomBotton(doctor: doctor),
            body: ModalProgressHUD(
              inAsyncCall: state.isBookingLoading,
              progressIndicator: CircularProgressIndicator(
                color: AppColors.borderAccent,
              ),
              child: SafeArea(
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverToBoxAdapter(child: DoctorDetailsHeader()),
                      SliverToBoxAdapter(
                        child: DoctorDetailsBadge(doctor: doctor),
                      ),
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
          );
        },
      ),
    );
  }
}
