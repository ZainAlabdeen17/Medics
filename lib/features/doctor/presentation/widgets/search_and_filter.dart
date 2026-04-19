import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/doctor/presentation/widgets/filter_button.dart';
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
          ),
        ),
        SizedBox(width: 8.w),
        const FilterButton(),
      ],
    );
  }
}
