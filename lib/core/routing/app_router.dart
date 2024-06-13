import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/features/login/ui/login_screen.dart';
import 'package:aflami/features/onboarding/ui/onboarding_screen.dart';
import 'package:aflami/features/register/ui/register_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

        case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

        case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );


      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('no route defined for ${settings.name}')),
                ));
    }
  }
}
