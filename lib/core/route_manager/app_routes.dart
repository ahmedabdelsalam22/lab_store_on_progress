import 'package:flutter/material.dart';
import 'package:lab_store/data_layer/models/dummy_data.dart';
import 'package:lab_store/presentation_layer/screens/auth/forget_password_screen.dart';
import 'package:lab_store/presentation_layer/screens/auth/login_screen.dart';
import 'package:lab_store/presentation_layer/screens/auth/register_screen.dart';
import 'package:lab_store/presentation_layer/screens/btm_screen/btm_nav_screen.dart';
import 'package:lab_store/presentation_layer/screens/details_screen.dart';

class AppRoutes {
  static const String loginScreenRoute = 'loginScreen';
  static const String registerScreenRoute = 'registerScreen';
  static const String forgetPasswordScreenRoute = 'forgetPasswordScreen';
  static const String btmNavScreenRoute = 'btmNavScreen';
  static const String productDetailsScreenRoute = 'productDetailsScreen';
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

      case AppRoutes.forgetPasswordScreenRoute:
        return MaterialPageRoute(
            builder: (_) => ForgetPasswordScreen(), settings: settings);

      case AppRoutes.btmNavScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BtmNavScreen(), settings: settings);

      case AppRoutes.productDetailsScreenRoute:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: product),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen(), settings: settings);
    }
  }
}
