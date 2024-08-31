import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  String currentLanguge = "en";

  ThemeMode currentThemeMode = ThemeMode.dark;

  changeCurrentLanguge(String newLanguge) {
    if (currentLanguge == newLanguge) return;
    currentLanguge = newLanguge;
    notifyListeners();
  }

  changeCurrentThemeMode(ThemeMode newThemeMode) {
    if (currentThemeMode == newThemeMode) return;
    currentThemeMode = newThemeMode;
    notifyListeners();
  }

  bool isDark() {
    return (currentThemeMode == ThemeMode.dark);
  }

  String getBackGroundImage() {
    return (currentThemeMode == ThemeMode.dark
        ? "assets/images/home_dark_background.png"
        : "assets/images/background.png");
  }

  String getSplashScreenImage() {
    return (currentThemeMode == ThemeMode.dark
        ? "assets/images/splash dark.png"
        : "assets/images/splash.png");
  }

  String getBodySebha() {
    return (currentThemeMode == ThemeMode.dark
        ? "assets/images/body of seb7a dark.png"
        : "assets/images/body of seb7a.png");
  }
}
