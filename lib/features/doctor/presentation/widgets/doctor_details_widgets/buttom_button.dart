import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/widgets/custom_fill_button.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_state.dart';

class BottomBotton extends StatelessWidget {
  const BottomBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 10.h),
            child: CustomFillButton(
              text: AppStrings.bookNow,
              onPressed: state.selectedTime.isNotEmpty
                  ? () {
                      context.push("/DoctorDetails");
                    }
                  : null,
            ),
          );
        },
      ),
    );
  }
}
