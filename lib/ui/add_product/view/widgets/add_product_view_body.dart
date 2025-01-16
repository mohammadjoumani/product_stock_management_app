import 'package:flutter/material.dart';
import 'package:product_stock_management_app/core/util/extension/widget_extension.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';

import 'name_product.dart';
import 'price_product.dart';
import 'quantity_product.dart';

class AddProductViewBody extends StatelessWidget {
  const AddProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NameProduct().marginOnly(bottom: AppPadding.p8),
            const PriceProduct().marginOnly(bottom: AppPadding.p8),
            const QuantityProduct().marginOnly(bottom: AppPadding.p8),
          ],
        ),
      ),
    );
  }
}
