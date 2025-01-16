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
import 'package:product_stock_management_app/ui/util/widgets/margin.dart';
import 'package:product_stock_management_app/ui/util/widgets/show_message.dart';

class ProductsFilterBottomSheet extends StatefulWidget {
  const ProductsFilterBottomSheet({super.key, required this.ref});

  final WidgetRef ref;

  @override
  State<ProductsFilterBottomSheet> createState() => _ProductsFilterBottomSheetState();
}

class _ProductsFilterBottomSheetState extends State<ProductsFilterBottomSheet> {
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  ProductStatus? productStatus;
  num? minPrice;
  num? maxPrice;

  @override
  void initState() {
    super.initState();
    minPrice = widget.ref.read(productsViewmodelProvider).minPrice;
    maxPrice = widget.ref.read(productsViewmodelProvider).maxPrice;
    productStatus = widget.ref.read(productsViewmodelProvider).productStatus;
    minPriceController.text = minPrice != null ? minPrice.toString() : '';
    maxPriceController.text = maxPrice != null ? maxPrice.toString() : '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
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
                      "All",
                      productStatus == null,
                      () {
                        setState(() {
                          productStatus = null;
                        });
                      },
                    ),
                  ),
                  const Sw2(),
                  Expanded(
                    child: _itemStockStatus(
                      "In stock",
                      productStatus == ProductStatus.inStock,
                      () {
                        setState(() {
                          productStatus = ProductStatus.inStock;
                        });
                      },
                    ),
                  ),
                  const Sw2(),
                  Expanded(
                    child: _itemStockStatus(
                      "Out stock",
                      productStatus == ProductStatus.outStock,
                      () {
                        setState(() {
                          productStatus = ProductStatus.outStock;
                        });
                      },
                    ),
                  ),
                  const Sw2(),
                  Expanded(
                    child: _itemStockStatus(
                      "Low stock",
                      productStatus == ProductStatus.lowStock,
                      () {
                        setState(() {
                          productStatus = ProductStatus.lowStock;
                        });
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
              CustomTextField(
                controller: minPriceController,
                hintText: 'Enter min price here',
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              ).marginOnly(bottom: AppPadding.p16),
              CustomTextField(
                controller: maxPriceController,
                hintText: 'Enter max price here',
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              ).marginOnly(bottom: AppPadding.p16),
              CustomButton(
                label: 'Filter',
                onPressed: () => _onPressedFilterButton(context),
              ),
            ],
          ),
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
    minPrice = num.tryParse(minPriceController.text);
    maxPrice = num.tryParse(maxPriceController.text);
    if (minPrice != null && maxPrice != null && minPrice! > maxPrice!) {
      showMessage(context: context, message: 'Min price must be less than max price');
      return;
    }
    if ((minPrice == null && maxPrice != null) || (minPrice != null && maxPrice == null)) {
      showMessage(context: context, message: 'Please enter min and max price');
      return;
    }
    widget.ref.read(productsViewmodelProvider.notifier).changeProductStatus(productStatus);
    widget.ref.read(productsViewmodelProvider.notifier).changeMinPrice(minPrice);
    widget.ref.read(productsViewmodelProvider.notifier).changeMaxPrice(maxPrice);
    widget.ref.read(productsViewmodelProvider.notifier).getProducts();
    Navigator.pop(context);
  }
}
