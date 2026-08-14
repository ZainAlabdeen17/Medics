import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/core/widgets/on_error_widget.dart';
import 'package:medics/features/appointments/presentation/cubit/appointment_cubit/appointment_cubit.dart';
import 'package:medics/features/appointments/presentation/cubit/appointment_cubit/appointment_state.dart';
import 'package:medics/features/appointments/presentation/widget/appoinment_card.dart';
import 'package:medics/features/appointments/presentation/widget/appointment_action_bottom_sheet.dart';
import 'package:medics/features/appointments/presentation/widget/shimmers/appointment_card_shimmer.dart';

class AppointmentsView extends StatefulWidget {
  const AppointmentsView({super.key});

  @override
  State<AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<AppointmentsView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter < 50) {
      context.read<AppointmentCubit>().getNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = context.read<AppointmentCubit>();
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await appointmentCubit.getAppointments();
          },
          backgroundColor: AppColors.surfaceCard,
          color: AppColors.borderAccent,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: GeneralHeader(title: AppStrings.upcomingAppointments),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                BlocBuilder<AppointmentCubit, AppointmentState>(
                  builder: (context, state) {
                    if (state is AppointmentsLoading) {
                      return SliverList.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 12.h),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return AppointmentCardShimmer();
                        },
                      );
                    }
                    if (state is AppointmentsFailure) {
                      return SliverFillRemaining(child: OnErrorWidget());
                    }
                    if (state is AppointmentsSuccess) {
                      return state.appointments.isEmpty
                          ? SliverFillRemaining(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 47.w,
                                      height: 47.h,
                                      child: SvgPicture.asset(
                                        Assets.assetsImagesAppointmentsCalendar,
                                        colorFilter: ColorFilter.mode(
                                          AppColors.iconAccent,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 24.h),
                                    Text(
                                      "No appoinments found",
                                      style: AppTextStyles.head2.copyWith(
                                        color: AppColors.textPrimary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      "Your appointments will appear here once they are available.",
                                      style: AppTextStyles.body1.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : SliverList.separated(
                              key: const PageStorageKey(
                                'appointments_list_key',
                              ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 12.h),
                              itemCount: state.appointments.length,
                              itemBuilder: (context, index) {
                                final appointment = state.appointments[index];
                                final doctor = appointment.doctor;
                                return AppointmentCard(
                                  doctorName:
                                      '${doctor.firstName} ${doctor.lastName}',
                                  specialty: doctor.specialization,
                                  date: appointment.date,
                                  time:
                                      "${appointment.startTime} - ${appointment.endTime}",

                                  imagePath: doctor.photoUrl,
                                  status: appointment.status,
                                  onTap: () {
                                    context.push(
                                      '/AppointmentDetails',
                                      extra: {
                                        'appointment': appointment,
                                        'appointment_cubit': appointmentCubit,
                                      },
                                    );
                                  },
                                  onMoreActionTap: () {
                                    showModalBottomSheet(
                                      sheetAnimationStyle: AnimationStyle(
                                        curve: Curves.bounceIn,
                                        duration: Duration(milliseconds: 500),
                                      ),
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: AppColors.surfaceCard,
                                      useSafeArea: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(24.r),
                                        ),
                                      ),
                                      builder: (context) =>
                                          AppointmentActionsBottomSheet(
                                            appointment: appointment,
                                            appointmentCubit: appointmentCubit,
                                          ),
                                    );
                                  },
                                );
                              },
                            );
                    }
                    return SliverToBoxAdapter(child: SizedBox.shrink());
                  },
                ),
                SliverToBoxAdapter(
                  child: BlocBuilder<AppointmentCubit, AppointmentState>(
                    builder: (context, state) {
                      final cubit = context.read<AppointmentCubit>();

                      if (cubit.isLoadingMore) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.iconAccent,
                            ),
                          ),
                        );
                      }

                      return SizedBox(height: 40.h);
                    },
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
