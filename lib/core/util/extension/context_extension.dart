import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void dismissKeyboard() {
    // FocusScope.of(this).requestFocus(FocusNode());
    // FocusScope.of(this).unfocus();
    // FocusManager.instance.primaryFocus?.unfocus();

    final focus = FocusManager.instance.primaryFocus;
    if (focus != null) {
      focus.unfocus();
    }
  }

  get getHeight => MediaQuery.sizeOf(this).height;

  get getWidth => MediaQuery.sizeOf(this).width;

  bool get isRtl => Directionality.of(this) == TextDirection.rtl;
}
