import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_scaffold.dart';

import 'widgets/transactions_view_body.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Transactions"),
      ),
      body: const TransactionsViewBody(),
    );
  }
}
