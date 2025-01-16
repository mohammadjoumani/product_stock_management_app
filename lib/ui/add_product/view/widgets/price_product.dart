import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/core/util/extension/widget_extension.dart';
import 'package:product_stock_management_app/ui/add_product/viewmodel/add_product_viewmodel.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_text_field.dart';

class PriceProduct extends ConsumerWidget {
  const PriceProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = ref.watch(addProductViewmodelProvider.select((value) => value.priceValidationMessage));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price",
          style: Styles.getMediumStyle(
            color: colorOnBackgroundScaffold,
          ),
        ).marginOnly(bottom: AppPadding.p8),
        CustomTextField(
          hintText: 'Enter price here',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          errorText: errorText.isEmpty ? null : errorText,
          onChanged: (value) => ref.read(addProductViewmodelProvider.notifier).changePrice(value),
        ),
      ],
    );
  }
}
