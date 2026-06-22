import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:medics/features/doctor/presentation/widgets/filter_widgets/filter_button.dart';
import 'package:medics/features/home/presentation/view/widgets/home_search_field.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: HomeSearchField(
            hintText: AppStrings.startTypingName,
            autoFocus: false,
            onChanged: (value) {
              final filterCubit = context.read<FilterCubit>();
              final doctorCubit = context.read<DoctorCubit>();
              filterCubit.updateSearchQuery(value);
              doctorCubit.getDoctors(
                searchQuery: value,
                specializations: filterCubit.state.selectedSpecializations,
                experience: filterCubit.state.selectedExperience as String?,
                gender: filterCubit.state.selectedGender as String?,
              );
            },
          ),
        ),
        SizedBox(width: 8.w),
        const FilterButton(),
      ],
    );
  }
}
