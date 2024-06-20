import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/features/login/logic/login_cubit/login_cubit.dart';
import 'package:aflami/features/login/ui/login_screen.dart';
import 'package:aflami/features/onboarding/ui/onboarding_screen.dart';
import 'package:aflami/features/register/logic/register_cubit/register_cubit.dart';
import 'package:aflami/features/register/ui/register_screen.dart';
import 'package:aflami/features/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

      case Routes.loginScreen:
        return PageTransition(
          child: BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
          type: PageTransitionType.fade,
        );

      case Routes.registerScreen:
        return PageTransition(
            type: PageTransitionType.fade,
            child: BlocProvider(
              create: (context) => RegisterCubit(),
              child: const RegisterScreen(),
            ));

      case Routes.homeScreen:
        return PageTransition(
          child: const HomeScreen(),
          type: PageTransitionType.fade,
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
