import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/core/util/extension/widget_extension.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/font_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_button.dart';
import 'package:product_stock_management_app/ui/util/widgets/margin.dart';

import 'widgets/custom_range_slider.dart';

class ProductsFilterBottomSheet extends ConsumerWidget {
  const ProductsFilterBottomSheet({super.key});
  // num? minPrice;
  // num? maxPrice;
  // ProductStatus? productStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stock status',
              style: Styles.getBoldStyle(
                color: colorOnBackgroundScaffold,
                fontSize: FontSize.s16,
              ),
            ).marginOnly(bottom: AppPadding.p8),
            Row(
              children: [
                Expanded(
                  child: _itemStockStatus(
                    "In stock",
                    false,
                    () {
                      // setState(() {
                      //   productStatus = ProductStatus.inStock;
                      // });
                      // viewmodel.changeProductStatus(ProductStatus.inStock);
                    },
                  ),
                ),
                const Sw2(),
                Expanded(
                  child: _itemStockStatus(
                    "Out stock",
                    false,
                    () {
                      // setState(() {
                      //   productStatus = ProductStatus.outStock;
                      // });
                    },
                  ),
                ),
                const Sw2(),
                Expanded(
                  child: _itemStockStatus(
                    "Low stock",
                    false,
                    () {
                      // setState(() {
                      //   productStatus = ProductStatus.lowStock;
                      // });
                    },
                  ),
                ),
              ],
            ).marginOnly(bottom: AppPadding.p16),
            Text(
              'Price',
              style: Styles.getBoldStyle(
                color: colorOnBackgroundScaffold,
                fontSize: FontSize.s16,
              ),
            ).marginOnly(bottom: AppPadding.p8),
            CustomRangeSlider(
              minPrice: 0,
              maxPrice: 10000,
              onRangeChanged: (RangeValues values) {
                // setState(() {
                //   minPrice = values.start;
                //   maxPrice = values.end;
                // });
              },
            ).marginOnly(bottom: AppPadding.p16),
            CustomButton(
              label: 'Filter',
              onPressed: () => _onPressedFilterButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemStockStatus(
    String label,
    bool isSelected,
    Function onTap,
  ) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p4),
        decoration: BoxDecoration(
          color: isSelected ? colorPrimary : colorBackgroundScaffold,
          borderRadius: BorderRadius.circular(AppSize.s4),
        ),
        alignment: Alignment.center,
        child: Center(
          child: Text(
            label,
            style: Styles.getMediumStyle(color: isSelected ? colorOnPrimary : colorOnBackgroundScaffold),
          ),
        ),
      ),
    );
  }

  _onPressedFilterButton(BuildContext context) {
    // ref.read(productsViewmodelProvider.notifier).changeProductStatus(productStatus);
    // ref.read(productsViewmodelProvider.notifier).changeMinPrice(minPrice);
    // ref.read(productsViewmodelProvider.notifier).changeMaxPrice(maxPrice);
    // ref.read(productsViewmodelProvider.notifier).getProducts();
    Navigator.pop(context);
  }
}
