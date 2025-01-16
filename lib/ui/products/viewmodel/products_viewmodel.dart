import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/repository/product_repository.dart';
import 'package:product_stock_management_app/ui/util/state_render/generic_data_state.dart';

import 'products_state.dart';

final productsViewmodelProvider = NotifierProvider.autoDispose<ProductsViewmodel, ProductsState>(
  () {
    return ProductsViewmodel();
  },
);

class ProductsViewmodel extends AutoDisposeNotifier<ProductsState> {
  @override
  ProductsState build() {
    state = _onInit();
    getProducts();
    return state;
  }

  ProductsState _onInit() => ProductsState();

  void getProducts() async {
    final productRepository = ref.read(productRepositoryProvider);
    state = state.copyWith(
      getProductsDataState: GenericDataState.loading,
    );
    final result = await productRepository.getAllProducts();
    result.fold(
      (l) => state = state.copyWith(
        getProductsDataState: GenericDataState.failure,
        errorMessage: l,
      ),
      (r) {
        if (r.isEmpty) {
          state = state.copyWith(getProductsDataState: GenericDataState.empty);
        } else {
          state = state.copyWith(getProductsDataState: GenericDataState.success, products: r);
        }
      },
    );
  }
}
