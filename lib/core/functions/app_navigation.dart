import 'package:go_router/go_router.dart';

class AppNavigation {
  static void pushScreen(context, String path) {
    GoRouter.of(context).push(path);
  }

  static void pushReplacementScreen(context, String path) {
    GoRouter.of(context).pushReplacement(path);
  }

  static void goToScreen(context, String path) {
    GoRouter.of(context).go(path);
  }

  static void popScreen(context) {
    GoRouter.of(context).pop();
  }

  static void delayedPushScreen(context, String path) {
    Future.delayed(Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacement(path);
    });
  }
}
