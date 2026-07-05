import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_state.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/container_notes.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/general_header_health_metrics.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // إنشاء الـ controller مرة واحدة فقط عند بدء تشغيل الصفحة
    final cubit = context.read<HealthCubit>();
    _controller = TextEditingController(text: cubit.state.notes);
  }

  @override
  void dispose() {
    // تنظيف الذاكرة لحمايتها من التسريب
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onSave(BuildContext context) async {
    final cubit = context.read<HealthCubit>();
    await cubit.save();
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HealthCubit>();

    return Scaffold(
      body: BlocBuilder<HealthCubit, HealthState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: GeneralHeaderHealthMetrics(
                      title: AppStrings.notes,
                      onSave: () => _onSave(context),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: ContainerNotes(
                      controller: _controller,
                      hintText: AppStrings.notesForYourDoctor,
                      onChanged: cubit.updateNotes, // تمرير دالة التحديث بنجاح الآن
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}