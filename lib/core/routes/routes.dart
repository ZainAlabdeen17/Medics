import 'package:go_router/go_router.dart';
import 'package:medics/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:medics/features/splash/presentation/view/splash_view.dart';

GoRouter route = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => SplashView()),
    GoRoute(path: "/OnBoarding", builder: (context, state) => OnBoardingView()),
  ],
);
