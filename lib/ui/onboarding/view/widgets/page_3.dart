import 'package:flutter/material.dart';
import 'package:product_stock_management_app/core/util/extension/context_extension.dart';
import 'package:product_stock_management_app/ui/util/resource/assets_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/font_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_svg_picture.dart';
import 'package:product_stock_management_app/ui/util/widgets/margin.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomSvgPicture(
          assetName: AssetsManager.imgOnboarding3,
          width: context.getWidth * 0.8,
          height: context.getWidth * 0.8,
        ),
        const Sh2(),
        Text(
          "Get Set Up in Minutes",
          style: Styles.getBoldStyle(
            color: colorOnBackgroundCard,
            fontSize: FontSize.s20,
          ),
        ),
        const Sh2(),
        Text(
          "Kickstart your stock management in three simple steps Add your products, organize your categories and start tracking and managing your inventory with ease.Your business, simplified. Let’s dive in!",
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
