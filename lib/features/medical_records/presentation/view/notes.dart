import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/container_notes.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/general_header_health_metrics.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: GeneralHeaderHealthMetrics(title: AppStrings.notes),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              SliverToBoxAdapter(
                child: ContainerNotes(text: AppStrings.notesForYourDoctor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}