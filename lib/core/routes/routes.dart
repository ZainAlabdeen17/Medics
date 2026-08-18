import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/services/service_locator.dart';
import 'package:medics/features/ai_chat/presentation/view/ai_chat_view.dart';
import 'package:medics/features/appointments/data/models/appointment_model.dart';
import 'package:medics/features/appointments/presentation/cubit/appointment_cubit/appointment_cubit.dart';
import 'package:medics/features/appointments/presentation/cubit/invoice_cubit/invoice_cubit.dart';
import 'package:medics/features/appointments/presentation/view/appointment_details_view.dart';
import 'package:medics/features/appointments/presentation/view/appointments_view.dart';
import 'package:medics/features/appointments/presentation/view/cancel_appointment_view.dart';
import 'package:medics/features/appointments/presentation/view/reschedule_appointment_view.dart';
import 'package:medics/features/auth/presentation/cubit/logout_cubit/logout_cubit.dart';
import 'package:medics/features/auth/presentation/view/otp_view.dart';
import 'package:medics/features/auth/presentation/view/sign_in_view.dart';
import 'package:medics/features/auth/presentation/view/sign_out_view.dart';
import 'package:medics/features/auth/presentation/view/sign_up_view.dart';
import 'package:medics/features/auth/presentation/view/success_verification_view.dart';
import 'package:medics/features/conversation/presentation/cubit/conversation_cubit/conversation_cubit.dart';
import 'package:medics/features/conversation/presentation/view/conversations_view.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_details_cubit/doctor_details_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/review_cubit/review_cubit.dart';
import 'package:medics/features/doctor/presentation/view/doctor_details_view.dart';
import 'package:medics/features/doctor/presentation/view/doctors_view.dart';
import 'package:medics/features/doctor/presentation/view/filter_view.dart';
import 'package:medics/features/doctor/presentation/view/inside_tabs/inside_review_tab/review_form_view.dart';
import 'package:medics/features/home/presentation/view/home_view.dart';
import 'package:medics/features/medical_records/data/models/visit_model.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_cubit/health_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/medical_tests_cubit/medical_tests_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/prescription_cubit/prescription_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/visits_cubit/visits_cubit.dart';
import 'package:medics/features/medical_records/presentation/view/anamnesis.dart';
import 'package:medics/features/medical_records/presentation/view/body_parameters.dart';
import 'package:medics/features/medical_records/presentation/view/health_metrics_information.dart';
import 'package:medics/features/medical_records/presentation/view/lab_report.dart';
import 'package:medics/features/medical_records/presentation/view/life_style.dart';
import 'package:medics/features/medical_records/presentation/view/medical_records_view.dart';
import 'package:medics/features/medical_records/presentation/view/medication_details.dart';
import 'package:medics/features/medical_records/presentation/view/notes.dart';
import 'package:medics/features/medical_records/presentation/view/prescription.dart';
import 'package:medics/features/medical_records/presentation/view/visit_summary_details.dart';
import 'package:medics/features/medical_records/presentation/view/visit_summeries.dart';
import 'package:medics/features/medical_records/presentation/view/x_rays_view.dart';
import 'package:medics/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:medics/features/patient_card/presentation/view/patient_view.dart';
import 'package:medics/features/payments/presentation/cubit/charge_wallet/charge_wallet_cubit.dart';
import 'package:medics/features/payments/presentation/cubit/wallet_balance/wallet_balance_cubit.dart';
import 'package:medics/features/payments/presentation/view/charge_wallet_view.dart';
import 'package:medics/features/profile/presentation/view/profile_view.dart';
import 'package:medics/features/root/presentation/view/root.dart';
import 'package:medics/features/specialization/presentation/cubit/specialization_cubit/specialization_cubit.dart';
import 'package:medics/features/specialization/presentation/view/specializations_view.dart';
import 'package:medics/features/splash/presentation/view/splash_view.dart';

GoRouter route = GoRouter(
  routes: [
    //spalsh
    GoRoute(path: "/", builder: (context, state) => SplashView()),
    //onboarding
    GoRoute(path: "/OnBoarding", builder: (context, state) => OnBoardingView()),
    //Auth
    GoRoute(
      path: "/SignUp",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: SignUpView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // const begin = Offset(0.0, 1.0);
            const begin = Offset(1.0, 0.0);
            // const begin = Offset(-1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(path: "/SignUp", builder: (context, state) => SignUpView()),
    GoRoute(
      path: "/Otp",
      builder: (context, state) {
        final email = state.extra as String;
        return OtpView(email: email);
      },
    ),
    GoRoute(
      path: "/LabReport",
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<MedicalTestsCubit>()..getMedicalTests(),
        child: LabReport(),
      ),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (context) => getIt<HealthCubit>(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: "/HealthMetrics",
          builder: (context, state) => const HealthMetricsInformation(),
        ),
        GoRoute(
          path: "/BodyParameters",
          builder: (context, state) => const BodyParameters(),
        ),
        GoRoute(path: "/Anamnesis", builder: (context, state) => Anamnesis()),
        GoRoute(path: "/LifeStyle", builder: (context, state) => LifeStyle()),
        GoRoute(path: "/Notes", builder: (context, state) => const Notes()),
      ],
    ),
    GoRoute(
      path: "/VisitSummeries",
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<VisitsCubit>()..getVisits(),
        child: VisitSummeries(),
      ),
    ),
    GoRoute(
      path: "/VisitSummaryDetails",
      builder: (context, state) {
        final visit = state.extra as VisitModel;
        return VisitSummaryDetails(visit: visit);
      },
    ),

    GoRoute(
      path: "/Prescription",
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<PrescriptionCubit>()..getPrescriptions(),
        child: Prescription(),
      ),
    ),
    GoRoute(
      path: "/MedicationDetails",
      builder: (context, state) => MedicationDetails(),
    ),
    GoRoute(
      path: "/SuccessVerification",
      builder: (context, state) => SuccessVerificationView(),
    ),
    GoRoute(
      path: "/SignOut",
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<LogoutCubit>(),
        child: SignOutView(),
      ),
    ),
    GoRoute(
      path: "/SignIn",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: SignInView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // const begin = Offset(0.0, 1.0);
            const begin = Offset(1.0, 0.0);
            // const begin = Offset(-1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: "/Otp",
      builder: (context, state) {
        final email = state.extra as String;
        return OtpView(email: email);
      },
    ),
    GoRoute(
      path: "/SuccessVerification",
      builder: (context, state) => SuccessVerificationView(),
    ),
    //medical recordes
    GoRoute(
      path: "/LabReport",
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<MedicalTestsCubit>()..getMedicalTests(),
        child: LabReport(),
      ),
    ),
    GoRoute(
      path: "/XRaysView",
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<MedicalTestsCubit>()..getXRays(),
        child: XRaysView(),
      ),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (context) => getIt<HealthCubit>(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: "/HealthMetrics",
          builder: (context, state) => HealthMetricsInformation(),
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
    GoRoute(path: "/Patient", builder: (context, state) => PatientView()),
    //appointments
    GoRoute(
      path: "/Appointments",
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AppointmentCubit>()..getAppointments(),
        child: AppointmentsView(),
      ),
    ),
    //specializations
    GoRoute(
      path: "/Specializations",
      builder: (context, state) {
        final specializationCubit = state.extra as SpecializationCubit;
        return MultiBlocProvider(
          providers: [BlocProvider.value(value: specializationCubit)],
          child: const SpecializationsView(),
        );
      },
    ),
    GoRoute(
      path: "/RescheduleAppointment",
      builder: (context, state) {
        final extraMap = state.extra as Map<String, dynamic>;
        final appointment = extraMap['appointment'] as AppointmentModel;
        final appointmentCubit =
            extraMap['appointment_cubit'] as AppointmentCubit;
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  getIt<BookCubit>()..getDays(doctorId: appointment.doctor.id),
            ),
            BlocProvider.value(value: appointmentCubit),
          ],
          child: RescheduleAppointmentView(appointment: appointment),
        );
      },
    ),
    GoRoute(
      path: "/CancelAppointment",
      builder: (context, state) {
        final extraMap = state.extra as Map<String, dynamic>;
        final appointment = extraMap['appointment'] as AppointmentModel;
        final appointmentCubit =
            extraMap['appointment_cubit'] as AppointmentCubit;
        return MultiBlocProvider(
          providers: [BlocProvider.value(value: appointmentCubit)],
          child: CancelAppointmentView(appointmentModel: appointment),
        );
      },
    ),
    //doctor
    GoRoute(
      path: "/Doctors",
      builder: (context, state) {
        final specialization = state.extra as String?;
        return MultiBlocProvider(
          providers: [
            BlocProvider<FilterCubit>(
              create: (context) {
                final filterCubit = FilterCubit();
                if (specialization != null) {
                  filterCubit.toggleSpecialization(specialization);
                  filterCubit.isFilterApplayed = true;
                  filterCubit.hasFilter();
                }
                return filterCubit;
              },
            ),
            BlocProvider<DoctorCubit>(
              create: (context) => getIt<DoctorCubit>()
                ..getDoctors(
                  specializations: specialization != null
                      ? [specialization]
                      : null,
                ),
            ),
          ],
          child: const DoctorsView(),
        );
      },
    ),
    GoRoute(
      path: "/Filter",
      builder: (context, state) {
        final Map<String, dynamic> extraMap =
            state.extra as Map<String, dynamic>;

        final filterCubit = extraMap['filterCubit'] as FilterCubit;
        final doctorCubit = extraMap['doctorCubit'] as DoctorCubit;

        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: filterCubit),
            BlocProvider.value(value: doctorCubit),
          ],
          child: const FilterView(),
        );
      },
    ),
    GoRoute(
      path: "/DoctorDetails",
      builder: (context, state) {
        final extraMap = state.extra as Map<String, dynamic>?;
        final doctor = extraMap?['doctor'] as DoctorModel;
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  getIt<BookCubit>()..getDays(doctorId: doctor.id),
            ),
            BlocProvider(create: (context) => getIt<DoctorDetailsCubit>()),
            BlocProvider(create: (context) => getIt<DoctorCubit>()),
            BlocProvider(
              create: (context) =>
                  ReviewCubit()..getReviews(doctorId: doctor.id),
            ),
          ],
          child: DoctorDetailsView(doctor: doctor),
        );
      },
    ),
    GoRoute(
      path: '/AppointmentDetails',
      builder: (context, state) {
        final extraData = state.extra as Map<String, dynamic>;
        final appointment = extraData['appointment'] as AppointmentModel;
        final cubit = extraData['appointment_cubit'] as AppointmentCubit?;
        if (cubit != null) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: cubit),
              BlocProvider(create: (context) => InvoiceCubit()),
            ],
            child: AppointmentDetailsView(appointmentModel: appointment),
          );
        }

        return BlocProvider(
          create: (context) => InvoiceCubit(),
          child: AppointmentDetailsView(appointmentModel: appointment),
        );
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
    GoRoute(path: "/AIChat", builder: (context, state) => AIChatView()),
    GoRoute(
      path: "/WalletCharge",
      builder: (context, state) {
        final walletBalanceCubit = state.extra as WalletBalanceCubit;
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: walletBalanceCubit),
            BlocProvider(
              create: (context) => getIt<ChargeWalletCubit>()..fetchPackages(),
            ),
          ],
          child: ChargeWalletView(),
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
            GoRoute(
              path: "/Home",
              builder: (context, state) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<DoctorCubit>()..getDoctors(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          getIt<SpecializationCubit>()..getSpecializations(),
                    ),
                  ],
                  child: HomeView(),
                );
              },
            ),
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
            GoRoute(
              path: "/Chat",
              builder: (context, state) => BlocProvider(
                create: (context) =>
                    getIt<ConversationsCubit>()..fetchConversations(),
                child: ConversationsView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/Profile",
              builder: (context, state) => BlocProvider(
                create: (context) =>
                    getIt<WalletBalanceCubit>()..getWalletBalance(),
                child: ProfileView(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
