import 'package:flutter/material.dart';
import 'package:product_stock_management_app/core/util/extension/context_extension.dart';
import 'package:product_stock_management_app/ui/util/resource/assets_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/font_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_svg_picture.dart';
import 'package:product_stock_management_app/ui/util/widgets/margin.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomSvgPicture(
          assetName: AssetsManager.imgOnboarding1,
          width: context.getWidth * 0.8,
          height: context.getWidth * 0.8,
        ),
        const Sh2(),
        Text(
          "Welcome to Easy Stock",
          style: Styles.getBoldStyle(
            color: colorOnBackgroundCard,
            fontSize: FontSize.s20,
          ),
        ),
        const Sh2(),
        Text(
          "Managing your inventory has never been easier. With StockSmart, you can track, organize, and optimize your stock levels effortlessly. Let’s get started on your journey to streamlined inventory management!",
          textAlign: TextAlign.center,
          maxLines: 4,
          style: Styles.getRegularStyle(
            color: colorOnBackgroundCard.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
