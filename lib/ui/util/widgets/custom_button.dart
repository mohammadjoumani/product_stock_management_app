import 'package:flutter/material.dart';
import 'package:product_stock_management_app/core/util/extension/widget_extension.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';

import 'custom_svg_picture.dart';

enum ButtonSize { small, large }

enum ButtonType { solid, outline }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.buttonType = ButtonType.solid,
    this.buttonSize = ButtonSize.large,
    this.assetsIcon,
  });

  final String label;
  final VoidCallback onPressed;
  final ButtonType buttonType;
  final ButtonSize buttonSize;
  final String? assetsIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonSize == ButtonSize.large ? AppSize.s48 : AppSize.s40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          elevation: 0,
          backgroundColor: buttonType == ButtonType.solid ? colorPrimary : colorOnPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          side: buttonType == ButtonType.outline ? BorderSide(color: colorPrimary) : null,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (assetsIcon != null) ...{
              CustomSvgPicture(
                assetName: assetsIcon!,
                width: AppSize.s20,
                height: AppSize.s20,
              ).marginOnly(end: AppPadding.p4),
            },

            // Text
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.getSemiBoldStyle(
                  color: buttonType == ButtonType.solid ? colorOnPrimary : colorPrimary,
                ).copyWith(
                  height: 1,
                  letterSpacing: 0.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
