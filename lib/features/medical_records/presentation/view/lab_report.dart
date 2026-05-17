import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/medical_records/data/rebort_model.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/build_lab_report_card.dart';

class LabReport extends StatelessWidget {
  const LabReport({super.key});

  @override
  Widget build(BuildContext context) {
    final labResult = LabResult.getReportResult();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        // alignment: Alignment.topCenter,
        child: CustomScrollView(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 32.h)),
            SliverToBoxAdapter(
              child: GeneralHeader(title: AppStrings.lapReports),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            SliverList.separated(
              itemCount: labResult.length,
              itemBuilder: (context, i) {
                return BuildLabReportCard(labResult: labResult[i]);
              },
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
            ),
          ],
        ),
      ),
    );
  }
}
