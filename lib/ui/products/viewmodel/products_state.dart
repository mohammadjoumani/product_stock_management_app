import 'package:product_stock_management_app/model/product.dart';
import 'package:product_stock_management_app/ui/util/state_render/generic_data_state.dart';

class ProductsState {
  final GenericDataState getProductsDataState;
  final List<Product> products;
  final String errorMessage;

  ProductsState({
    this.getProductsDataState = GenericDataState.initial,
    this.products = const [],
    this.errorMessage = '',
  });

  ProductsState copyWith({
    GenericDataState? getProductsDataState,
    List<Product>? products,
    String? errorMessage,
  }) {
    return ProductsState(
      getProductsDataState: getProductsDataState ?? this.getProductsDataState,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
