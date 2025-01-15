import 'package:flutter/material.dart';
import 'package:product_stock_management_app/core/util/extension/context_extension.dart';
import 'package:product_stock_management_app/ui/util/resource/assets_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/font_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_svg_picture.dart';
import 'package:product_stock_management_app/ui/util/widgets/margin.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomSvgPicture(
          assetName: AssetsManager.imgOnboarding2,
          width: context.getWidth * 0.8,
          height: context.getWidth * 0.8,
        ),
        const Sh2(),
        Text(
          "Streamline Your Inventory",
          style: Styles.getBoldStyle(
            color: colorOnBackgroundCard,
            fontSize: FontSize.s20,
          ),
        ),
        const Sh2(),
        Text(
          "Stay on top of your stock with powerful features like real-time tracking, low-stock alerts, and detailed reports. With StockSmart, you’ll save time and reduce errors, all while keeping your inventory in perfect balance.",
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
