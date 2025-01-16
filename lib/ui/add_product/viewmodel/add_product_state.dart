import 'package:product_stock_management_app/ui/util/state_render/generic_data_state.dart';

class AddProductState {
  final GenericDataState addProductDataState;
  final String name;
  final num price;
  final num quantity;
  final String nameValidationMessage;
  final String priceValidationMessage;
  final String quantityValidatedMessage;
  final String errorMessage;

  AddProductState({
    this.addProductDataState = GenericDataState.initial,
    this.name = '',
    this.price = 0,
    this.quantity = 0,
    this.nameValidationMessage = '',
    this.priceValidationMessage = '',
    this.quantityValidatedMessage = '',
    this.errorMessage = '',
  });

  AddProductState copyWith({
    GenericDataState? addProductDataState,
    String? name,
    num? price,
    num? quantity,
    String? nameValidationMessage,
    String? priceValidationMessage,
    String? quantityValidatedMessage,
    String? errorMessage,
  }) {
    return AddProductState(
      addProductDataState: addProductDataState ?? this.addProductDataState,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      nameValidationMessage: nameValidationMessage ?? this.nameValidationMessage,
      priceValidationMessage: priceValidationMessage ?? this.priceValidationMessage,
      quantityValidatedMessage: quantityValidatedMessage ?? this.quantityValidatedMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
