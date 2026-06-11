import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/appointments/data/models/appoinment_model.dart';
import 'package:medics/features/appointments/presentation/widget/appoinment_card.dart';

class Appointments extends StatelessWidget {
  Appointments({super.key});
  final List<Appointment> appointments = Appointment.getAppointments();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: GeneralHeader(title: AppStrings.upcomingAppointments),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              SliverList.separated(
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final appointment = appointments[index];
                  return AppointmentCard(
                    doctorName: appointment.doctorName,
                    specialty: appointment.specialty,
                    date: appointment.date,
                    time: appointment.time,
                    imagePath: appointment.imagePath,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
