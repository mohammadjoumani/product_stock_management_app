import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_stock_management_app/core/util/extension/context_extension.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.fillColor,
    this.controller,
    this.suffix,
    this.suffixIcon,
    this.suffixText,
    this.helperText,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.maxLength,
    this.maxLines,
    this.inputFormatters = const <TextInputFormatter>[],
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.autofillHints,
    this.textAlign = TextAlign.start,
  });

  final String hintText;
  final Color? fillColor;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixText;
  final String? errorText;
  final String? helperText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final GestureTapCallback? onTap;
  final List<TextInputFormatter> inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool enabled;
  final Iterable<String>? autofillHints;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: context.isRtl
          ? Styles.getRegularStyle(color: colorPrimary)
          : Styles.getRegularStyle(color: colorHintText).copyWith(
              height: 1,
              letterSpacing: 0.4,
            ),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: fillColor,
        suffix: suffix,
        suffixIcon: suffixIcon,
        suffixText: suffixText,
        helperText: helperText,
        errorText: errorText,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: obscureText ? 1 : maxLines,
      maxLength: maxLength,
      readOnly: readOnly,
      enabled: enabled,
      textInputAction: textInputAction,
      onTapOutside: (value) => context.dismissKeyboard(),
      autofillHints: autofillHints,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      textAlign: textAlign,
    );
  }
}
