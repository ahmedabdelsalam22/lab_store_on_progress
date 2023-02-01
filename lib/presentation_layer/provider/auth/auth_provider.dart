import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/route_manager/app_routes.dart';

class AuthProvider with ChangeNotifier {
  var auth = FirebaseAuth.instance;

  void signUpWithEmailAndPassword(
      String email, String password, BuildContext context) {
    auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      debugPrint(value.user!.email);
      Navigator.pushReplacementNamed(context, AppRoutes.btmNavScreenRoute);
    }).catchError((onError) {
      debugPrint(onError.toString());
    });
    notifyListeners();
  }

  void signInWithEmailAndPassword(
      String email, String password, BuildContext context) {
    auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      debugPrint('login success');
      debugPrint(value.user!.email);
      Navigator.pushReplacementNamed(context, AppRoutes.btmNavScreenRoute);
    }).catchError((onError) {
      debugPrint(onError.toString());
    });
    notifyListeners();
  }
}
