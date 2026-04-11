import 'package:go_router/go_router.dart';
import 'package:medics/features/auth/presentation/view/otp_view.dart';
import 'package:medics/features/auth/presentation/view/sign_in_view.dart';
import 'package:medics/features/auth/presentation/view/sign_up_view.dart';
import 'package:medics/features/auth/presentation/view/success_verification_view.dart';
import 'package:medics/features/auth/presentation/view/widgets/forget_password.dart';
import 'package:medics/features/chat/presentation/view/chat_view.dart';
import 'package:medics/features/home/presentation/view/home_view.dart';
import 'package:medics/features/medical_records/presentation/view/medical_records_view.dart';
import 'package:medics/features/on_boarding/presentation/view/on_boarding_view.dart';
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
    GoRoute(
      path: "/SuccessVerification",
      builder: (context, state) => SuccessVerificationView(),
    ),
    GoRoute(path: "/SignIn", builder: (context, state) => SignInView()),
    GoRoute(
      path: "/ForgetPassword",
      builder: (context, state) => ForgetPassword(),
    ),
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
    GoRoute(path: "/Specializations", builder: (context, state) => const SpecializationsView()),
  ],
);
