import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/widgets/custom_divider.dart';
import 'package:medics/core/widgets/custom_fill_button.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/appointments/data/models/appointment_model.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_state.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/booking_reason_text_field.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/day_slots_section.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/price_section.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/time_slots_section.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_form_widgets/doctor_info.dart';

class RescheduleAppointmentView extends StatelessWidget {
  const RescheduleAppointmentView({super.key, required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        final bookCubit = context.read<BookCubit>();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView(
                key: const PageStorageKey<String>('DoctorBookContent'),

                children: [
                  GeneralHeader(title: 'Reschedule options'),
                  SizedBox(height: 5.h),
                  DoctorInfo(doctor: appointment.doctor),
                  CustomDivider(),
                  PriceSection(doctor: appointment.doctor),
                  CustomDivider(),
                  DaySlotsSection(doctor: appointment.doctor),
                  CustomDivider(),
                  TimeSlotsSection(),
                  CustomDivider(),
                  BookingReasonTextField(maxLines: 4),
                  SizedBox(height: 30.h),
                  CustomFillButton(
                    text: "Reschedule",
                    onPressed: bookCubit.isReadyToBook() ? () {} : null,
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
