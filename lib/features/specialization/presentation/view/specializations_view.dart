import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/specialization/data/specialization_model.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/specialization/presentation/view/widget/specialization_item.dart';

class SpecializationsView extends StatelessWidget {
  const SpecializationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.h, right: 16, bottom: 10.h),
          child: Column(
            children: [
              GeneralHeader(title: AppStrings.specializations),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return SpecializationItem(
                      specializationName: specializations[index].name,
                      icon: specializations[index].icon,
                      doctorsCount: specializations[index].doctorsCount,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                  itemCount: specializations.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
