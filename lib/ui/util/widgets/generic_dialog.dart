import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';

import 'custom_button.dart';
import 'margin.dart';

enum DialogType { cancellation, delete, confirmation, logout }

class GenericDialog extends StatelessWidget {
  const GenericDialog({
    super.key,
    required this.dialogType,
    required this.title,
    required this.message,
    required this.labelButtonOne,
    required this.labelButtonTwo,
    required this.onPressedButtonOne,
    required this.onPressedButtonTwo,
  });

  final DialogType dialogType;
  final String title;
  final String message;
  final String labelButtonOne;
  final String labelButtonTwo;
  final VoidCallback onPressedButtonOne;
  final VoidCallback onPressedButtonTwo;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: colorBackgroundCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                featureIcon(dialogType),
                const Sw3(),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Styles.getMediumStyle(color: colorOnPrimary),
                      ),
                      Text(
                        message,
                        style: Styles.getRegularStyle(color: colorOnPrimary),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Sh4(),

            //Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: 'AppStrings.strNo.tr(context)',
                    onPressed: onPressedButtonTwo,
                    buttonType: ButtonType.outline,
                    buttonSize: ButtonSize.small,
                  ),
                ),
                const Sw3(),
                Expanded(
                  child: CustomButton(
                    label: "AppStrings.strYes.tr(context)",
                    onPressed: onPressedButtonOne,
                    buttonType: ButtonType.solid,
                    buttonSize: ButtonSize.small,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  featureIcon(DialogType dialogType) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: dialogType == DialogType.confirmation ? colorPrimary.withOpacity(0.1) : colorSecondary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: dialogType == DialogType.confirmation ? colorPrimary.withOpacity(0.2) : colorSecondary.withOpacity(0.2),
              width: AppSize.s4,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.error_outline,
              color: dialogType == DialogType.confirmation ? colorPrimary : colorSecondary,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
