import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  var auth = FirebaseAuth.instance;

  void signUpWithEmailAndPassword(String email, String password) {
    auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      debugPrint(value.user!.email);
    }).catchError((onError) {
      debugPrint(onError.toString());
    });
    notifyListeners();
  }

  void signInWithEmailAndPassword(String email, String password) {
    auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      debugPrint('login success');
      debugPrint(value.user!.email);
    }).catchError((onError) {
      debugPrint(onError.toString());
    });
    notifyListeners();
  }
}
