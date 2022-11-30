import 'package:flutter/cupertino.dart';
import 'package:lab_store/core/style/theme_shared_pref.dart';

class ThemeProvider with ChangeNotifier {
  static ThemePreference themePreference = ThemePreference();

  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    themePreference.setDarkTheme(value);
    notifyListeners();
  }
}
