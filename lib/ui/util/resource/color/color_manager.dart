import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/resource/color/dark_color.dart';
import 'package:product_stock_management_app/ui/util/resource/color/light_color.dart';
import 'package:product_stock_management_app/ui/util/resource/color/main_color.dart';

final appColor = AppColor(
  [
    LightColor(),
    DarkColor(),
  ],
);

Color get colorPrimary => appColor.getColorPrimary;

Color get colorSecondary => appColor.getColorSecondary;

Color get colorBackgroundScaffold => appColor.getColorBackgroundScaffold;

Color get colorBackgroundCard => appColor.getColorBackgroundCard;

Color get colorOnPrimary => appColor.getColorOnPrimary;

Color get colorOnSecondary => appColor.getColorOnSecondary;

Color get colorOnBackgroundScaffold => appColor.getColorOnBackgroundScaffold;

Color get colorOnBackgroundCard => appColor.getColorOnBackgroundCard;

Color get colorOnBackgroundCard1 => const Color(0x9905101c);

Color get colorError => appColor.getColorError;

Color get colorOnError => appColor.getColorOnError;

Color get colorDisable => appColor.getColorDisable;

Color get colorOnDisable => appColor.getColorOnDisable;

Color get colorHintText => const Color(0xFFA0A0A0);

Color get colorBorderTextField => const Color(0xFFA0A0A0);

BoxShadow get genericBoxShadow => const BoxShadow(
      color: Color(0x14000000),
      blurRadius: 10,
      offset: Offset(0, 2),
      spreadRadius: 0,
    );

MaterialColor get primarySwatch => const MaterialColor(
      0xFFffffff,
      <int, Color>{
        50: Color(0xFFffffff),
        100: Color(0xFFffffff),
        200: Color(0xFFffffff),
        300: Color(0xFFffffff),
        400: Color(0xFFffffff),
        500: Color(0xFFffffff),
        600: Color(0xFFffffff),
        700: Color(0xFFffffff),
        800: Color(0xFFffffff),
        900: Color(0xFFffffff),
      },
    );
