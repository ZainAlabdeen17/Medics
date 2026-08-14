import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/functions/show_custom_toast.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_fill_button.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/appointments/data/models/appointment_model.dart';
import 'package:medics/features/appointments/presentation/cubit/appointment_cubit/appointment_cubit.dart';
import 'package:medics/features/appointments/presentation/cubit/appointment_cubit/appointment_state.dart';
import 'package:medics/features/appointments/presentation/view/appointment_details_view.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_form_widgets/doctor_info.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CancelAppointmentView extends StatefulWidget {
  const CancelAppointmentView({super.key, required this.appointmentModel});
  final AppointmentModel appointmentModel;

  @override
  State<CancelAppointmentView> createState() => _CancelAppointmentViewState();
}

class _CancelAppointmentViewState extends State<CancelAppointmentView> {
  final TextEditingController _cancelAppointmentController =
      TextEditingController();
  @override
  void dispose() {
    _cancelAppointmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentState>(
      buildWhen: (previous, current) {
        return current is AppointmentActionLoading ||
            current is AppointmentCancelSuccess ||
            current is AppointmentActionFailure;
      },
      listener: (context, state) {
        if (state is AppointmentCancelSuccess) {
          showCustomToast(
            context: context,
            title: state.message,
            primaryColor: AppColors.iconGreen,
            icon: Icon(Icons.check_sharp, color: AppColors.borderGreen),
          );
          context.pop();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<AppointmentCubit>().getAppointments();
          });
        }
        if (state is AppointmentActionFailure) {
          showCustomToast(
            context: context,
            title: state.errorMessage,
            primaryColor: AppColors.iconRed,
            icon: Icon(Icons.cancel_outlined, color: AppColors.iconRed),
          );
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<AppointmentCubit>().getAppointments();
          });
        }
      },
      builder: (context, state) {
        final appointmentCubit = context.read<AppointmentCubit>();
        return ModalProgressHUD(
          inAsyncCall: state is AppointmentActionLoading,
          progressIndicator: CircularProgressIndicator(
            color: AppColors.borderAccent,
          ),
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView(
                  children: [
                    GeneralHeader(title: "Cancel Appointment"),
                    SizedBox(height: 8.h),
                    DoctorInfo(doctor: widget.appointmentModel.doctor),
                    SizedBox(height: 8.h),
                    InfoPiece(
                      title: 'Date:',
                      icon: Assets.assetsImagesAppointmentsCalendar,
                      value: widget.appointmentModel.date,
                    ),
                    InfoPiece(
                      title: 'Time:',
                      icon: Assets.assetsImagesAppointmentsClock,
                      value:
                          "${widget.appointmentModel.startTime} - ${widget.appointmentModel.endTime}",
                    ),
                    InfoPiece(
                      title: 'Status:',
                      icon: Assets.assetsImagesAppointmentsVerification,
                      value: widget.appointmentModel.status,
                    ),
                    InfoPiece(
                      title: 'Session Price:',
                      icon: Assets.assetsImagesAppointmentsPay,
                      value: "${widget.appointmentModel.doctor.sessionPrice}\$",
                    ),
                    Text(
                      'Cancellation Reason',
                      style: AppTextStyles.head2.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    CustomTextField(
                      controller: _cancelAppointmentController,
                      onChanged: (_) {
                        setState(() {});
                      },
                      hintText: "Enter your reason for cancellation.....",
                      maxLines: 5,
                      isBigFeild: true,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Note: Canceling this appointment means 30% of your first-time session payment is non-refundable. For further details, see our Terms & Policies or reach out to us.',
                      style: AppTextStyles.body3.copyWith(
                        color: AppColors.textRed,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CustomFillButton(
                      text: "Cancel",
                      onPressed:
                          _cancelAppointmentController.text.trim().isNotEmpty
                          ? () {
                              appointmentCubit.cancelAppointment(
                                appointmentId: widget.appointmentModel.id,
                                reason: _cancelAppointmentController.text
                                    .trim(),
                              );
                            }
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
