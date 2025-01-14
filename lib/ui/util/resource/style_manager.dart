import 'package:flutter/material.dart';

import 'color/color_manager.dart';
import 'font_manager.dart';

abstract class Styles {
  static TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, color) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: 1.8,
      // letterSpacing: 0.4,
    );
  }
  //
  // static TextStyle getCustomTextStyle({required TextStyle arabicStyle, TextStyle? englishStyle}) {
  //   final isArabic = _appPref.getAppLanguage() == LanguageType.arabic.getValue();
  //   return isArabic ? arabicStyle : englishStyle ?? arabicStyle;
  // }

  static TextStyle getRegularStyle({double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.regular, color);
  }

  static TextStyle getMediumStyle({double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.medium, color);
  }

  static TextStyle getLightStyle({double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.light, color);
  }

  static TextStyle getBoldStyle({double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.bold, color);
  }

  static TextStyle getSemiBoldStyle({double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
  }
}
