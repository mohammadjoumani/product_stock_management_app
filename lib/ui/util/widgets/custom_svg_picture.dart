import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// AppPreferences _appPref = instance<AppPreferences>();

class CustomSvgPicture extends StatelessWidget {
  const CustomSvgPicture({
    super.key,
    required this.assetName,
    this.height,
    this.width,
    this.color,
    this.isRtl = false,
  });

  final String assetName;
  final double? height;
  final double? width;
  final Color? color;
  final bool isRtl;

  @override
  Widget build(BuildContext context) {
    // bool isArabic = _appPref.getAppLanguage() == LanguageType.arabic.getValue();
    return Transform.rotate(
      angle: isRtl ? 3.14 : 0,
      child: SvgPicture.asset(
        assetName,
        height: height,
        width: width,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      ),
    );
  }
}
