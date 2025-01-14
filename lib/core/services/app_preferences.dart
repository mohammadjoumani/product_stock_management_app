import 'dart:ui';

import 'package:product_stock_management_app/ui/util/resource/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

String keyLang = "KEY_LANG";
String keyFontSize = "KEY_FONT_SIZE";

String keyIsUserLoggedIn = "KEY_IS_USER_LOGGED_IN";
String keyOnBoardingScreenViewed = "KEY_ON_BOARDING_SCREEN_VIEWED";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // region Language
  String getAppLanguage() {
    String? language = _sharedPreferences.getString(keyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.arabic.getValue();
    }
  }

  bool isEnglish() {
    return getAppLanguage() == LanguageType.english.getValue();
  }

  Future<void> setLocale(String lang) async {
    _sharedPreferences.setString(keyLang, lang);
  }

  Locale getLocale() {
    String currentLang = getAppLanguage();

    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocale;
    } else {
      return englishLocale;
    }
  }

  //endregion

  //region FontSize

  // FontSizeAppEnum getFontSize() {
  //   String? fontSize = _sharedPreferences.getString(keyFontSize);
  //   if (fontSize != null && fontSize.isNotEmpty) {
  //     return FontSizeAppEnum.values.firstWhere((element) => element.name == fontSize);
  //   } else {
  //     return FontSizeAppEnum.small;
  //   }
  // }

  // Future<void> setFontSize(FontSizeAppEnum fontSizeApp) async {
  //   _sharedPreferences.setString(keyFontSize, fontSizeApp.name);
  // }

  //endregion

  //region OnBoarding

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(keyOnBoardingScreenViewed, true);
  }

  bool isOnBoardingScreenViewed() {
    return _sharedPreferences.getBool(keyOnBoardingScreenViewed) ?? false;
  }

//endregion
}
