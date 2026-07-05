import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/functions/show_custom_toast.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/appointments/data/models/appointment_model.dart';
import 'package:medics/features/appointments/presentation/cubit/invoice_cubit/invoice_cubit.dart';
import 'package:medics/features/appointments/presentation/cubit/invoice_cubit/invoice_state.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_form_widgets/doctor_info.dart';

class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({super.key, required this.appointmentModel});
  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InvoiceCubit, InvoiceState>(
      listener: (context, state) {
        if (state is DownloadInvoiceSuccess) {
          showCustomToast(
            context: context,
            title: "Downloaded successfully!",
            primaryColor: AppColors.iconGreen,
            icon: Icon(Icons.check_sharp, color: AppColors.borderGreen),
          );
        }
        if (state is DownloadInvoiceFailure) {
          showCustomToast(
            context: context,
            title: "Try downlaod invoice again",
            descriptionText: state.errorMessage,
            primaryColor: AppColors.iconRed,
            icon: Icon(Icons.cancel_outlined, color: AppColors.iconRed),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: GeneralHeader(title: "Appointment"),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 8.0.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      'Appointment Details',
                      style: AppTextStyles.head2.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 8.0.h)),
                  SliverToBoxAdapter(
                    child: DoctorInfo(doctor: appointmentModel.doctor),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 8.0.h)),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoPiece(
                            title: 'Date:',
                            icon: Assets.assetsImagesAppointmentsCalendar,
                            value: appointmentModel.date,
                          ),
                          InfoPiece(
                            title: 'Time:',
                            icon: Assets.assetsImagesAppointmentsClock,
                            value:
                                "${appointmentModel.startTime} - ${appointmentModel.endTime}",
                          ),
                          InfoPiece(
                            title: 'Status:',
                            icon: Assets.assetsImagesAppointmentsVerification,
                            value: appointmentModel.status,
                          ),

                          InfoPiece(
                            title: 'Session Price:',
                            icon: Assets.assetsImagesAppointmentsPay,
                            value: "${appointmentModel.doctor.sessionPrice}\$",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reason',
                          style: AppTextStyles.head2.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 8.0.h),
                        Text(
                          appointmentModel.reason,
                          style: AppTextStyles.body1.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 12.0.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      'Invoice',
                      style: AppTextStyles.head2.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 8.h)),
                  SliverToBoxAdapter(
                    child: Container(
                      width: double.infinity,
                      height: 152.h,
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: AppColors.surfaceCard,
                        border: Border.all(
                          color: AppColors.borderBlack,
                          width: 1.w,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Invoice Code : \n${appointmentModel.invoiceNumber}',
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.textSecondary,
                              fontFamily: 'Inter',
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 12.h),
                          GestureDetector(
                            onTap: state is DownloadInvoiceLoading
                                ? null
                                : () {
                                    context.read<InvoiceCubit>().downloadInvoice(
                                      "https://renewably-gladly-blitz.ngrok-free.dev/api/v1/invoices/${appointmentModel.invoiceId}/download",
                                      "Invoice-${appointmentModel.id}.pdf",
                                    );
                                  },
                            child: state is DownloadInvoiceLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      value: state.progress,

                                      backgroundColor: Colors.grey[200],
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.borderAccent,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.btnPrimary,
                                      borderRadius: BorderRadius.circular(
                                        100.r,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 30.h,
                                          width: 30.w,
                                          child: SvgPicture.asset(
                                            Assets
                                                .assetsImagesIconsGeneralDownload,
                                            colorFilter: ColorFilter.mode(
                                              AppColors.iconStaticWhite,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 35.h)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class InfoPiece extends StatelessWidget {
  const InfoPiece({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
  });

  final String title;
  final String icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 24.w,
                height: 24.h,
                child: SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(
                    AppColors.iconAccent,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                title,
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: AppTextStyles.body1.copyWith(
              color: value == 'pending'
                  ? AppColors.textOrange
                  : value == 'completed'
                  ? AppColors.textGreen
                  : AppColors.textSecondary,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
