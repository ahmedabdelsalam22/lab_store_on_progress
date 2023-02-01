import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  var auth = FirebaseAuth.instance;

  void userRegister(String email, String password) {
    auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
    }).catchError((onError) {
      print(onError.toString());
    });
    notifyListeners();
  }
}
