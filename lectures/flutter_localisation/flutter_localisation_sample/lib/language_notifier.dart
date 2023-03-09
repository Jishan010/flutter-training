import 'package:flutter/material.dart';

class LanguageNotifier extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void setLocal(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
