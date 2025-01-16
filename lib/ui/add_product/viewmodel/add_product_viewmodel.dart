import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/model/product.dart';
import 'package:product_stock_management_app/repository/product_repository.dart';
import 'package:product_stock_management_app/ui/add_product/viewmodel/add_product_state.dart';
import 'package:product_stock_management_app/ui/util/state_render/generic_data_state.dart';

final addProductViewmodelProvider = NotifierProvider.autoDispose<AddProductViewmodel, AddProductState>(
  () {
    return AddProductViewmodel();
  },
);

class AddProductViewmodel extends AutoDisposeNotifier<AddProductState> {
  @override
  AddProductState build() {
    state = _onInit();
    return state;
  }

  AddProductState _onInit() => AddProductState();

  Future<void> addProduct() async {
    final x1 = getNameValidationMessage(state.name);
    final x2 = getPriceValidationMessage(state.price);
    final x3 = getQuantityValidatedMessage(state.quantity);
    if (x1.isNotEmpty || x2.isNotEmpty || x3.isNotEmpty) {
      state = state.copyWith(
        nameValidationMessage: x1,
        priceValidationMessage: x2,
        quantityValidatedMessage: x3,
      );
      return;
    }
    final productRepository = ref.read(productRepositoryProvider);
    state = state.copyWith(
      addProductDataState: GenericDataState.loading,
    );
    final result = await productRepository.addProduct(
      Product(
        name: state.name,
        price: state.price,
        quantity: state.quantity,
      ),
    );
    result.fold(
      (l) => state = state.copyWith(
        addProductDataState: GenericDataState.loading,
        errorMessage: l,
      ),
      (r) => state = state.copyWith(
        addProductDataState: GenericDataState.success,
      ),
    );
  }

  void changeName(String value) {
    state = state.copyWith(
      name: value,
      nameValidationMessage: getNameValidationMessage(value),
    );
  }

  void changePrice(String value) {
    num price = num.tryParse(value) ?? 0;
    state = state.copyWith(
      price: price,
      priceValidationMessage: getPriceValidationMessage(price),
    );
  }

  void changeQuantity(String value) {
    num quantity = num.tryParse(value) ?? 0;
    state = state.copyWith(
      quantity: quantity,
      quantityValidatedMessage: getQuantityValidatedMessage(quantity),
    );
  }

  String getNameValidationMessage(String value) => value.isEmpty ? '* Name is required' : '';

  String getPriceValidationMessage(num value) => value <= 0 ? '* Price is required' : '';

  String getQuantityValidatedMessage(num value) => value <= 0 ? '* Quantity is required' : '';
}
