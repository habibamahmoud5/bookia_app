import 'package:bookia_app/core/routes/app_routes.dart';
import 'package:bookia_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:bookia_app/features/auth/repo/auth_repo.dart';
import 'package:bookia_app/features/auth/ui/login_screen.dart';
import 'package:bookia_app/features/auth/ui/register_screen.dart';
import 'package:bookia_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/ui/home_screen.dart';
import 'package:bookia_app/features/home/presentation/ui/search_screen.dart';
import 'package:bookia_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.onbordingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(AuthRepo()),
            child: LoginScreen(),
          ),
        );

      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(AuthRepo()),
            child: RegisterScreen(),
          ),
        );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit()..getBestSellerBooks(),
            child: HomeScreen(),
          ),
        );
      case AppRoutes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit()..search(""),
            child: SearchScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
