import 'package:bookia_app/core/routes/app_routes.dart';
import 'package:bookia_app/features/auth/ui/login_screen.dart';
import 'package:bookia_app/features/auth/ui/register_screen.dart';
import 'package:bookia_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.onbordingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
    }
    return null;
  }
}
