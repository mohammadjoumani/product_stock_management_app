import 'package:flutter/material.dart';

import 'main_color.dart';

class DarkColor extends MainColorInterface {
  @override
  Color get colorPrimary => const Color(0xFF8875FF);

  @override
  Color get colorSecondary => const Color(0xFF242969);

  @override
  Color get colorBackgroundScaffold => const Color(0XFF121212);

  @override
  Color get colorBackgroundCard => const Color(0xFF535353);

  @override
  Color get colorOnPrimary => const Color(0XFFFFFFFF);

  @override
  Color get colorOnSecondary => const Color(0XFFFFFFFF);

  @override
  Color get colorOnBackgroundScaffold => const Color(0XFFFFFFFF);

  @override
  Color get colorOnBackgroundCard => const Color(0XFFFFFFFF);

  @override
  Color get colorError => const Color(0xFFEB5757);

  @override
  Color get colorOnError => const Color(0XFFFFFFFF);

  @override
  Color get colorDisable => const Color(0xFFA0A0A0);

  @override
  Color get colorOnDisable => const Color(0XFFFFFFFF);
}
