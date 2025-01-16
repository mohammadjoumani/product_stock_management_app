import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/model/product.dart';
import 'package:product_stock_management_app/model/transaction.dart';
import 'package:product_stock_management_app/repository/product_repository.dart';
import 'package:product_stock_management_app/repository/transaction_repository.dart';
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
    final result = await productRepository.getAllProducts(
      productStatus: state.productStatus,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
    );
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

  void changeProductStatus(ProductStatus? productStatus) {
    state = state.copyWith(
      productStatus: productStatus,
      resetProductStatus: productStatus == null,
    );
  }

  void changeMinPrice(num? value) {
    state = state.copyWith(
      minPrice: value,
      resetMinPrice: value == null,
    );
  }

  void changeMaxPrice(num? value) {
    state = state.copyWith(
      maxPrice: value,
      resetMaxPrice: value == null,
    );
  }

  increaseDecreaseQuantityToProduct(int productId, num quantity) async {
    final transactionRepository = ref.read(transactionRepositoryProvider);
    state = state.copyWith(
      increaseOrDecreaseQuantityDataState: GenericDataState.loading,
    );
    final result = await transactionRepository.addTransaction(
      Transaction(
        productId: productId,
        quantityChange: quantity,
        date: DateTime.now().toString(),
      ),
    );
    result.fold(
        (l) => state = state.copyWith(
              increaseOrDecreaseQuantityDataState: GenericDataState.failure,
              errorMessage: l,
            ), (r) {
      getProducts();
      state = state.copyWith(
        increaseOrDecreaseQuantityDataState: GenericDataState.success,
      );
    });
  }
}
