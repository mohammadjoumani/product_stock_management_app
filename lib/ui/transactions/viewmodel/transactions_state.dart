import 'package:product_stock_management_app/model/product.dart';
import 'package:product_stock_management_app/model/transaction.dart';
import 'package:product_stock_management_app/ui/util/state_render/generic_data_state.dart';

class TransactionsState {
  final GenericDataState getTransactionsDataState;
  final List<Transaction> transactions;
  final String errorMessage;

  TransactionsState({
    this.getTransactionsDataState = GenericDataState.initial,
    this.transactions = const [],
    this.errorMessage = '',
  });

  TransactionsState copyWith({
    GenericDataState? getTransactionsDataState,
    List<Transaction>? transactions,
    String? errorMessage,
  }) {
    return TransactionsState(
      getTransactionsDataState: getTransactionsDataState ?? this.getTransactionsDataState,
      transactions: transactions ?? this.transactions,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
