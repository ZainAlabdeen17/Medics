import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/features/auth/presentation/view/otp_view.dart';
import 'package:medics/features/auth/presentation/view/sign_in_view.dart';
import 'package:medics/features/auth/presentation/view/sign_up_view.dart';
import 'package:medics/features/auth/presentation/view/success_verification_view.dart';
import 'package:medics/features/auth/presentation/view/widgets/forget_password.dart';
import 'package:medics/features/chat/presentation/view/chat_view.dart';
import 'package:medics/features/doctor/data/doctor_model.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/review_cubit/review_cubit.dart';
import 'package:medics/features/doctor/presentation/view/doctor_details_view.dart';
import 'package:medics/features/doctor/presentation/view/doctors_view.dart';
import 'package:medics/features/doctor/presentation/view/filter_view.dart';
import 'package:medics/features/doctor/presentation/view/inside_tabs/inside_review_tab/review_form_view.dart';
import 'package:medics/features/home/presentation/view/home_view.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_cubit.dart';
import 'package:medics/features/medical_records/presentation/view/anamnesis.dart';
import 'package:medics/features/medical_records/presentation/view/body_parameters.dart';
import 'package:medics/features/medical_records/presentation/view/health_metrics.dart';
import 'package:medics/features/medical_records/presentation/view/lab_report.dart';
import 'package:medics/features/medical_records/presentation/view/life_style.dart';
import 'package:medics/features/medical_records/presentation/view/medical_records_view.dart';
import 'package:medics/features/medical_records/presentation/view/medication_details.dart';
import 'package:medics/features/medical_records/presentation/view/notes.dart';
import 'package:medics/features/medical_records/presentation/view/prescription.dart';
import 'package:medics/features/medical_records/presentation/view/visit_summeries.dart';
import 'package:medics/features/on_boarding/presentation/view/on_boarding_view.dart';

import 'package:medics/features/patient_card/presentation/view/patient_view.dart';

import 'package:medics/features/profile/presentation/view/profile_view.dart';
import 'package:medics/features/root/presentation/view/root.dart';
import 'package:medics/features/specialization/presentation/view/specializations_view.dart';

import 'package:medics/features/splash/presentation/view/splash_view.dart';

GoRouter route = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => SplashView()),
    GoRoute(path: "/OnBoarding", builder: (context, state) => OnBoardingView()),
    GoRoute(path: "/SignUp", builder: (context, state) => SignUpView()),
    GoRoute(path: "/Otp", builder: (context, state) => OtpView()),
    GoRoute(path: "/LabReport", builder: (context, state) => LabReport()),
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(create: (_) => HealthCubit(), child: child);
      },
      routes: [
        GoRoute(
          path: "/HealthMetrics",
          builder: (context, state) => HealthMetrics(),
        ),
        GoRoute(
          path: "/BodyParameters",
          builder: (context, state) => BodyParameters(),
        ),
        GoRoute(path: "/Anamnesis", builder: (context, state) => Anamnesis()),
        GoRoute(path: "/LifeStyle", builder: (context, state) => LifeStyle()),
        GoRoute(path: "/Notes", builder: (context, state) => Notes()),
      ],
    ),
    GoRoute(
      path: "/VisitSummeries",
      builder: (context, state) => VisitSummeries(),
    ),

    GoRoute(path: "/Prescription", builder: (context, state) => Prescription()),
    GoRoute(
      path: "/MedicationDetails",
      builder: (context, state) => MedicationDetails(),
    ),
    GoRoute(
      path: "/SuccessVerification",
      builder: (context, state) => SuccessVerificationView(),
    ),
    GoRoute(path: "/SignIn", builder: (context, state) => SignInView()),

    GoRoute(path: "/Patient", builder: (context, state) => PatientView()),

    GoRoute(
      path: "/ForgetPassword",
      builder: (context, state) => ForgetPassword(),
    ),
    GoRoute(
      path: "/Specializations",
      builder: (context, state) => const SpecializationsView(),
    ),
    GoRoute(path: "/Doctors", builder: (context, state) => const DoctorsView()),
    GoRoute(
      path: "/Filter",
      builder: (context, state) {
        final cubit = state.extra as FilterCubit;
        return BlocProvider.value(value: cubit, child: const FilterView());
      },
    ),
    GoRoute(
      path: "/DoctorDetails",
      builder: (context, state) {
        final doctor = state.extra as DoctorModel;
        return DoctorDetailsView(doctor: doctor);
      },
    ),
    GoRoute(
      path: "/ReviewForm",
      builder: (context, state) {
        final doctor = state.extra as DoctorModel;
        return BlocProvider(
          create: (context) => ReviewCubit(),
          child: ReviewFormView(doctor: doctor),
        );
      },
    ),
    //
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Root(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: "/Home", builder: (context, state) => HomeView()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/MedicalRecords",
              builder: (context, state) => MedicalRecordsView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: "/Chat", builder: (context, state) => ChatView()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/Profile",
              builder: (context, state) => ProfileView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
