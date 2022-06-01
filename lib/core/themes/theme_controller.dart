import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeThemeState extends ChangeNotifier {
  bool darkMode = false;

  void enableDarkMode() {
    darkMode = true;
    notifyListeners();
  }

  void enableLightMode() {
    darkMode = false;
    notifyListeners();
  }
}

final changeTheme = ChangeNotifierProvider.autoDispose((ref) {
  return ChangeThemeState();
});
