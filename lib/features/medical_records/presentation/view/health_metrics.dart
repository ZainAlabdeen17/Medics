// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:medics/core/utils/app_strings.dart';
// import 'package:medics/core/widgets/general_header.dart';
// import 'package:medics/features/medical_records/presentation/view/widgets/health_metrics_list_tile.dart';

// class HealthMetrics extends StatelessWidget {
//   const HealthMetrics({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                 child: GeneralHeader(title: AppStrings.healthMetrics),
//               ),
//             ),
//             SliverToBoxAdapter(child: SizedBox(height: 16.h)),
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 HealthMetrixListTile(
//                   title: AppStrings.bodyParameters,
//                   location: "/BodyParameters",
//                 ),
//                 HealthMetrixListTile(
//                   title: AppStrings.lifestyle,
//                   location: "/LifeStyle",
//                 ),
//                 HealthMetrixListTile(
//                   title: AppStrings.anamnesis,
//                   location: "/Anamnesis",
//                 ),
//                 HealthMetrixListTile(
//                   title: AppStrings.notes,
//                   location: "/Notes",
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
