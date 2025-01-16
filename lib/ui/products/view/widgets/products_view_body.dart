import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/model/product.dart';
import 'package:product_stock_management_app/ui/products/viewmodel/products_viewmodel.dart';
import 'package:product_stock_management_app/ui/util/state_render/generic_data_state.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_loading.dart';

import 'header_table.dart';
import 'item_product.dart';

class ProductsViewBody extends ConsumerWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(productsViewmodelProvider.notifier).getProducts();
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
    switch (dataState) {
      case GenericDataState.loading:
        return const Center(
          child: CustomLoading(),
        );
      case GenericDataState.success:
        return ListView.builder(
          itemBuilder: (context, index) => ItemProduct(product: products[index]),
          itemCount: products.length,
        );
      case GenericDataState.empty:
        return const Center(
          child: Text('Empty Data'),
        );
      case GenericDataState.failure:
        return const Center(
          child: Text('Error'),
        );
      default:
        return const SizedBox();
    }
  }

  // List<Product> getProducts() {
  //   return [
  //     Product(id: 110010, name: 'Product 1', price: 100, quantity: 100, status: ProductStatus.inStock),
  //     Product(id: 110011, name: 'Product 2', price: 150, quantity: 200, status: ProductStatus.inStock),
  //     Product(id: 110012, name: 'Product 3', price: 200, quantity: 150, status: ProductStatus.outStock),
  //     Product(id: 110013, name: 'Product 4', price: 250, quantity: 50, status: ProductStatus.inStock),
  //     Product(id: 110014, name: 'Product 5', price: 300, quantity: 300, status: ProductStatus.inStock),
  //     Product(id: 110015, name: 'Product 6', price: 120, quantity: 120, status: ProductStatus.outStock),
  //     Product(id: 110016, name: 'Product 7', price: 180, quantity: 180, status: ProductStatus.inStock),
  //     Product(id: 110017, name: 'Product 8', price: 130, quantity: 80, status: ProductStatus.inStock),
  //     Product(id: 110018, name: 'Product 9', price: 220, quantity: 90, status: ProductStatus.inStock),
  //     Product(id: 110019, name: 'Product 10', price: 310, quantity: 110, status: ProductStatus.outStock),
  //     Product(id: 110020, name: 'Product 11', price: 400, quantity: 250, status: ProductStatus.inStock),
  //     Product(id: 110021, name: 'Product 12', price: 500, quantity: 50, status: ProductStatus.inStock),
  //     Product(id: 110022, name: 'Product 13', price: 600, quantity: 75, status: ProductStatus.inStock),
  //     Product(id: 110023, name: 'Product 14', price: 700, quantity: 90, status: ProductStatus.lowStock),
  //     Product(id: 110024, name: 'Product 15', price: 800, quantity: 60, status: ProductStatus.inStock),
  //     Product(id: 110025, name: 'Product 16', price: 900, quantity: 120, status: ProductStatus.inStock),
  //     Product(id: 110026, name: 'Product 17', price: 1000, quantity: 40, status: ProductStatus.inStock),
  //     Product(id: 110027, name: 'Product 18', price: 1100, quantity: 140, status: ProductStatus.inStock),
  //     Product(id: 110028, name: 'Product 19', price: 1200, quantity: 30, status: ProductStatus.outStock),
  //     Product(id: 110029, name: 'Product 20', price: 1300, quantity: 200, status: ProductStatus.inStock),
  //     Product(id: 110030, name: 'Product 21', price: 1400, quantity: 170, status: ProductStatus.lowStock),
  //     Product(id: 110032, name: 'Product 23', price: 1600, quantity: 130, status: ProductStatus.inStock),
  //     Product(id: 110033, name: 'Product 24', price: 1700, quantity: 20, status: ProductStatus.inStock),
  //     Product(id: 110034, name: 'Product 25', price: 1800, quantity: 110, status: ProductStatus.outStock),
  //     Product(id: 110035, name: 'Product 26', price: 1900, quantity: 95, status: ProductStatus.inStock),
  //     Product(id: 110036, name: 'Product 27', price: 2000, quantity: 55, status: ProductStatus.inStock),
  //     Product(id: 110037, name: 'Product 28', price: 2100, quantity: 120, status: ProductStatus.inStock),
  //     Product(id: 110038, name: 'Product 29', price: 2200, quantity: 150, status: ProductStatus.outStock),
  //     Product(id: 110039, name: 'Product 30', price: 2300, quantity: 85, status: ProductStatus.lowStock)
  //   ];
  // }
}
