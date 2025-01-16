import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/repository/transaction_repository.dart';
import 'package:product_stock_management_app/ui/util/state_render/generic_data_state.dart';

import 'transactions_state.dart';

final transactionsViewmodelProvider = NotifierProvider.autoDispose<TransactionsViewmodel, TransactionsState>(
  () {
    return TransactionsViewmodel();
  },
);

class TransactionsViewmodel extends AutoDisposeNotifier<TransactionsState> {
  @override
  TransactionsState build() {
    state = _onInit();
    getTransactions();
    return state;
  }

  TransactionsState _onInit() => TransactionsState();

  void getTransactions() async {
    final transactionRepository = ref.read(transactionRepositoryProvider);
    state = state.copyWith(
      getTransactionsDataState: GenericDataState.loading,
    );
    final result = await transactionRepository.getAllTransactions();
    result.fold(
      (l) => state = state.copyWith(
        getTransactionsDataState: GenericDataState.failure,
        errorMessage: l,
      ),
      (r) {
        if (r.isEmpty) {
          state = state.copyWith(getTransactionsDataState: GenericDataState.empty);
        } else {
          state = state.copyWith(
            getTransactionsDataState: GenericDataState.success,
            transactions: r,
          );
        }
      },
    );
  }
}
