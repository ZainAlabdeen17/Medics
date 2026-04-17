import 'package:go_router/go_router.dart';
import 'package:medics/features/auth/presentation/view/otp_view.dart';
import 'package:medics/features/auth/presentation/view/sign_in_view.dart';
import 'package:medics/features/auth/presentation/view/sign_up_view.dart';
import 'package:medics/features/auth/presentation/view/success_verification_view.dart';
import 'package:medics/features/auth/presentation/view/widgets/forget_password.dart';
import 'package:medics/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:medics/features/patient_card/presentation/view/patient_view.dart';
import 'package:medics/features/splash/presentation/view/splash_view.dart';

GoRouter route = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => SplashView()),
    GoRoute(path: "/OnBoarding", builder: (context, state) => OnBoardingView()),
    GoRoute(path: "/SignUp", builder: (context, state) => SignUpView()),
    GoRoute(path: "/Otp", builder: (context, state) => OtpView()),
    GoRoute(path: "/SuccessVerification", builder: (context, state) => SuccessVerificationView()),
    GoRoute(path: "/SignIn", builder: (context, state) => SignInView()),
    GoRoute(path: "/ForgetPassword", builder: (context, state) => ForgetPassword()),
    GoRoute(path: "/Patient", builder: (context, state) => PatientView()),
  ],
);
