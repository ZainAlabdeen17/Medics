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
  late TextEditingController notesController;
  bool isInitialized = false;
  @override
  void initState() {
    super.initState();
    notesController = TextEditingController();
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  void _fillControllers(String? notes) {
    if (notes != null) {
      notesController.text = notes;
    }
  }

  void _onSave() {
    final notesRaw = notesController.text.trim();

    context.read<HealthCubit>().updateNotes(notesRaw);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HealthCubit, HealthState>(
        builder: (context, state) {
          if (state is HealthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HealthLoaded && !isInitialized) {
            _fillControllers(state.model.notes);
            isInitialized = true;
          }

          if (state is HealthError) {
            return Center(child: Text(state.message));
          }

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: GeneralHeaderHealthMetrics(
                      title: AppStrings.notes,
                      onSave: _onSave,
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: ContainerNotes(
                      hintText: AppStrings.notesForYourDoctor,
                      controller: notesController,
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
