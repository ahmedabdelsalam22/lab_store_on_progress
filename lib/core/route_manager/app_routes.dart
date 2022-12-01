import 'package:flutter/material.dart';
import 'package:lab_store/presentation_layer/screens/auth/login_screen.dart';
import 'package:lab_store/presentation_layer/screens/auth/register_screen.dart';

class AppRoutes {
  static const String loginScreenRoute = 'loginScreen';
  static const String registerScreenRoute = 'registerScreen';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.registerScreenRoute:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );

      case AppRoutes.loginScreenRoute:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen(), settings: settings);
    }
  }
}
