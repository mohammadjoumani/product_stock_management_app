import 'package:product_stock_management_app/model/product.dart';
import 'package:product_stock_management_app/ui/util/state_render/generic_data_state.dart';

class ProductsState {
  final GenericDataState getProductsDataState;
  final GenericDataState increaseOrDecreaseQuantityDataState;
  final List<Product> products;
  final ProductStatus? productStatus;
  final num? minPrice;
  final num? maxPrice;
  final String errorMessage;

  ProductsState({
    this.getProductsDataState = GenericDataState.initial,
    this.increaseOrDecreaseQuantityDataState = GenericDataState.initial,
    this.products = const [],
    this.productStatus,
    this.minPrice,
    this.maxPrice,
    this.errorMessage = '',
  });

  ProductsState copyWith({
    GenericDataState? getProductsDataState,
    GenericDataState? increaseOrDecreaseQuantityDataState,
    List<Product>? products,
    ProductStatus? productStatus,
    num? minPrice,
    num? maxPrice,
    bool resetProductStatus = false,
    bool resetMinPrice = false,
    bool resetMaxPrice = false,
    String? errorMessage,
  }) {
    return ProductsState(
      getProductsDataState: getProductsDataState ?? this.getProductsDataState,
      increaseOrDecreaseQuantityDataState: increaseOrDecreaseQuantityDataState ?? this.increaseOrDecreaseQuantityDataState,
      products: products ?? this.products,
      productStatus: resetProductStatus ? null : (productStatus ?? this.productStatus),
      minPrice: resetMinPrice ? null : (minPrice ?? this.minPrice),
      maxPrice: resetMaxPrice ? null : (maxPrice ?? this.maxPrice),
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
