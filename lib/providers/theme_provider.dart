import 'package:flutter/material.dart';

enum AppTheme { light, dark }

class ThemeProvider extends ChangeNotifier {
  AppTheme _currentTheme = AppTheme.light;

  String _fontFamily = 'FiraCode'; // default font family

  AppTheme get currentTheme => _currentTheme;

  String get fontFamily => _fontFamily;

  void changeTheme(AppTheme newTheme) {
    _currentTheme = newTheme;
    notifyListeners();
  }

  void changeFontFamily(String newFontFamily) {
    _fontFamily = newFontFamily;
    notifyListeners();
  }

  ThemeData get theme {
    switch (_currentTheme) {
      case AppTheme.light:
        return ThemeData.light().copyWith(
          primaryColor: Colors.blue,
          hintColor: Colors.blueAccent,
          textTheme: ThemeData.light().textTheme.apply(
                fontFamily: _fontFamily,
                bodyColor: Colors.black,
              ),
        );
      case AppTheme.dark:
        return ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey,
          hintColor: Colors.blueGrey.shade300,
          textTheme: ThemeData.dark().textTheme.apply(
                fontFamily: _fontFamily,
                bodyColor: Colors.white,
              ),
        );
    }
  }
}
