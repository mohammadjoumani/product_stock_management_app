import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/resource/assets_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AssetsManager.imgOnboarding1,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.8,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "",
                style: Styles.getSemiBoldStyle(color: colorOnPrimary),
              ),
              TextSpan(
                text: "AppStrings.strSeha.tr(context)",
                style: Styles.getSemiBoldStyle(color: colorPrimary),
              ),
              TextSpan(
                text: '{AppStrings.strOne.tr(context)}',
                style: Styles.getRegularStyle(color: colorSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
