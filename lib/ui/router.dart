
import 'package:guzo_go_demo/ui/screens/auth/splash_screen.dart';

import 'package:guzo_go_demo/ui/widgets/bottomAppBar.dart';

import 'package:flutter/material.dart';

class AppRouter {
  /*
  static final routes = [
    GetPage(
      name: '/E01',
      page: () => const LoginPage(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/E02',
      page: () => const ForgotPasswordPage(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/E03',
      page: () => const PageLanding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];*/

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/nav':
        return MaterialPageRoute(builder: (_) =>  AppNavigationBar());
      case '/splash': return MaterialPageRoute(builder: (_) => SplashView(),);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route found for ${settings.name}'),
                  ),
                ));
    }
  }
}
