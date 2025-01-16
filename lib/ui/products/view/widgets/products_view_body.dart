import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/core/util/extension/context_extension.dart';
import 'package:product_stock_management_app/ui/products/viewmodel/products_viewmodel.dart';
import 'package:product_stock_management_app/ui/util/resource/assets_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/font_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/state_render/generic_data_state.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_loading.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_svg_picture.dart';

import 'header_table.dart';
import 'item_product.dart';

class ProductsViewBody extends ConsumerWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const HeaderTable(),
        Expanded(
          child: _buildProductsBasedOnState(context, ref),
        ),
      ],
    );
  }

  Widget _buildProductsBasedOnState(BuildContext context, WidgetRef ref) {
    final products = ref.watch(
      productsViewmodelProvider.select(
        (value) => value.products,
      ),
    );
    final dataState = ref.watch(
      productsViewmodelProvider.select(
        (value) => value.getProductsDataState,
      ),
    );
    final errorMessage = ref.watch(
      productsViewmodelProvider.select(
        (value) => value.errorMessage,
      ),
    );
    switch (dataState) {
      case GenericDataState.loading:
        return const Center(
          child: CustomLoading(),
        );
      case GenericDataState.success:
        return ListView.builder(
          itemBuilder: (context, index) => ItemProduct(
            product: products[index],
          ),
          itemCount: products.length,
        );
      case GenericDataState.empty:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSvgPicture(
              assetName: AssetsManager.imgEmptyProducts,
              width: context.getWidth * 0.6,
              height: context.getWidth * 0.6,
            ),
            Text(
              'Empty Data',
              style: Styles.getMediumStyle(
                color: colorOnBackgroundScaffold,
                fontSize: FontSize.s18,
              ),
            ),
          ],
        );
      case GenericDataState.failure:
        return Center(
          child: Text(
            errorMessage,
            style: Styles.getBoldStyle(
              color: colorError,
              fontSize: FontSize.s24,
            ),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
