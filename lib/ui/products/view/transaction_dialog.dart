import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/core/util/extension/widget_extension.dart';
import 'package:product_stock_management_app/model/product.dart';
import 'package:product_stock_management_app/ui/products/viewmodel/products_viewmodel.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/font_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_button.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_text_field.dart';
import 'package:product_stock_management_app/ui/util/widgets/show_message.dart';

class TransactionDialog extends ConsumerWidget {
  TransactionDialog(this.product, {super.key});

  final Product product;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Please enter the quantity to increase or decrease",
              style: Styles.getBoldStyle(
                color: colorOnBackgroundScaffold,
                fontSize: FontSize.s18,
              ),
              textAlign: TextAlign.center,
            ).marginOnly(bottom: AppPadding.p16),
            CustomTextField(
              controller: controller,
              hintText: 'Enter the quantity here',
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
            ).marginOnly(bottom: AppPadding.p16),
            CustomButton(
              label: 'Increase',
              onPressed: () => _onPressedIncreaseButton(context, ref),
            ).marginOnly(bottom: AppPadding.p16),
            CustomButton(
              label: 'Decrease',
              onPressed: () => _onPressedDecreaseButton(context, ref),
              buttonType: ButtonType.outline,
            ).marginOnly(bottom: AppPadding.p16),
          ],
        ),
      ),
    );
  }

  _onPressedIncreaseButton(BuildContext context, WidgetRef ref) {
    final quantity = double.tryParse(controller.text);
    if (quantity == null) {
      showMessage(context: context, message: 'Please enter the quantity');
      return;
    }
    if (quantity == 0 || quantity < 0) {
      showMessage(context: context, message: 'Quantity must be greater than 0');
      return;
    }
    ref.read(productsViewmodelProvider.notifier).increaseDecreaseQuantityToProduct(
          product.id!,
          quantity,
        );
    Navigator.pop(context);
  }

  _onPressedDecreaseButton(BuildContext context, WidgetRef ref) {
    final quantity = double.tryParse(controller.text);
    if (quantity == null) {
      showMessage(context: context, message: 'Please enter the quantity');
      return;
    }
    if (quantity == 0 || quantity < 0) {
      showMessage(context: context, message: 'Quantity must be greater than 0');
      return;
    }
    if (quantity > product.quantity!) {
      showMessage(context: context, message: 'Quantity must be less than ${product.quantity}');
      return;
    }
    ref.read(productsViewmodelProvider.notifier).increaseDecreaseQuantityToProduct(
          product.id!,
          quantity * -1,
        );
    Navigator.pop(context);
  }
}
