import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/resource/assets_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/font_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AssetsManager.imgOnboarding3,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.8,
        ),
        Column(
          children: [
            Text(
              "AppStrings.strPage3Title.tr(context)",
              style: Styles.getSemiBoldStyle(color: colorOnPrimary),
            ),
            // const Sh2(),
            Text(
              "AppStrings.strPage3Desc.tr(context)",
              textAlign: TextAlign.center,
              maxLines: 4,
              style: Styles.getMediumStyle(
                color: colorOnPrimary,
                fontSize: FontSize.s16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
