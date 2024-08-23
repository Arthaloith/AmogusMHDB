import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en', '');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    Intl.defaultLocale = locale.toString();
    notifyListeners();
  }
}
