import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/widgets/custom_divider.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_state.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/booking_reason_text_field.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/day_slots_section.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/price_section.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/time_slots_section.dart';

class DoctorBookContent extends StatelessWidget {
  const DoctorBookContent({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            left: 16.w,
            right: 16.w,
            bottom: 5.h,
          ),
          child: ListView(
            key: const PageStorageKey<String>('DoctorBookContent'),

            children: [
              PriceSection(doctor: doctor),
              CustomDivider(),
              DaySlotsSection(doctor: doctor),
              CustomDivider(),
              TimeSlotsSection(),
              CustomDivider(),
              BookingReasonTextField(),
            ],
          ),
        );
      },
    );
  }
}


// CustomScrollView(
//               slivers: [
//                 SliverToBoxAdapter(child: PriceSection()),
//                 SliverToBoxAdapter(child: CustomDivider()),
//                 SliverToBoxAdapter(child: DaySlotsSection()),
//                 SliverToBoxAdapter(child: CustomDivider()),
//                 SliverToBoxAdapter(child: TimeSlotsSection()),
//                 SliverToBoxAdapter(child: SizedBox(height: 32.h)),
//                 SliverToBoxAdapter(
//                   child: CustomFillButton(
//                     text: "Book Now",
//                     onPressed: state.selectedTime.isNotEmpty ? () {} : null,
//                   ),
//                 ),
//               ],
//             ),