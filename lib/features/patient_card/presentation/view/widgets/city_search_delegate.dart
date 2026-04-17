import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';

class CitySearchDelegate extends SearchDelegate<String> {
  final List<String> allCities = [
    "Boston, MA",
    "Bowling Green, KY",
    "Bozeman, MT",
    "Boise, ID",
    "Bonita Springs, FL",
    "Bodega Bay, CA",
    "Syria , SA",
  ];

  @override
  String get searchFieldLabel => "";
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: AppColors.borderBlack,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.borderBlack,
      ),
    );
  }

  // 3. تعطيل الأزرار الافتراضية لأننا أضفناها في buildAppBar
  @override
  List<Widget>? buildActions(BuildContext context) => [];
  @override
  Widget? buildLeading(BuildContext context) => null;

  @override
  Widget buildResults(BuildContext context) => const SizedBox();

  // 4. بناء قائمة الاقتراحات (الموقع الحالي + المدن)
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = allCities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
      color: AppColors.borderBlack,
      child: ListView(
        padding: EdgeInsets.only(top: 10.h),
        children: [
          
          _buildLocationTile(
            "Use current location",
            Icons.location_on_outlined,
            trailing: Icons.near_me_outlined,
            onTap: () => close(context, "Current Location"),
          ),

          ...suggestions.map(
            (city) => _buildLocationTile(
              city,
              Icons.location_on_outlined,
              onTap: () => close(context, city),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationTile(
    String title,
    IconData leading, {
    IconData? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(leading),
      title: Text(
        title
      ),
      trailing: trailing != null
          ? Icon(trailing)
          : null,
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
      visualDensity: VisualDensity.compact,
    );
  }
}
