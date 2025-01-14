import 'dart:ui';

import '../theme_manager.dart';

abstract class MainColorInterface {
  Color get colorPrimary;

  Color get colorSecondary;

  Color get colorBackgroundScaffold;

  Color get colorBackgroundCard;

  Color get colorOnPrimary;

  Color get colorOnSecondary;

  Color get colorOnBackgroundScaffold;

  Color get colorOnBackgroundCard;

  Color get colorError;

  Color get colorOnError;

  Color get colorDisable;

  Color get colorOnDisable;
}

class AppColor {
  final List<MainColorInterface> _mainColors;

  // final AppPreferences _appPref;
  int index = 0;

  AppColor(this._mainColors) {
    updateAppStyle();
  }

  void updateAppStyle() {
    final themeMap = {
      ThemeApp.light: 0,
      ThemeApp.dark: 1,
    };
    index = themeMap[ThemeApp.dark] ?? 0;
  }

  Color get getColorPrimary => _mainColors[index].colorPrimary;

  Color get getColorSecondary => _mainColors[index].colorSecondary;

  Color get getColorBackgroundScaffold => _mainColors[index].colorBackgroundScaffold;

  Color get getColorBackgroundCard => _mainColors[index].colorBackgroundCard;

  Color get getColorOnPrimary => _mainColors[index].colorOnPrimary;

  Color get getColorOnSecondary => _mainColors[index].colorOnSecondary;

  Color get getColorOnBackgroundScaffold => _mainColors[index].colorOnBackgroundScaffold;

  Color get getColorOnBackgroundCard => _mainColors[index].colorOnBackgroundCard;

  Color get getColorError => _mainColors[index].colorError;

  Color get getColorOnError => _mainColors[index].colorOnError;

  Color get getColorDisable => _mainColors[index].colorDisable;

  Color get getColorOnDisable => _mainColors[index].colorOnDisable;
}
