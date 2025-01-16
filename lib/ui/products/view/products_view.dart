import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/ui/products/viewmodel/products_viewmodel.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/routes/routes_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_scaffold.dart';

import 'products_filter_bottom_sheet.dart';
import 'widgets/products_view_body.dart';

class ProductsView extends ConsumerWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.filter_alt),
          onPressed: () => _onPressedFilterButton(context, ref),
        ),
        title: const Text("Products"),
        actions: [
          IconButton(
            icon: const Icon(Icons.archive_rounded),
            onPressed: () => _onPressedTransactionButton(context),
          ),
        ],
      ),
      body: const ProductsViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onPressedAddButton(context, ref),
        backgroundColor: colorPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }

  _onPressedAddButton(BuildContext context, WidgetRef ref) async {
    final result = await Navigator.pushNamed(context, Routes.addProductRoute);
    if (result != null) {
      ref.read(productsViewmodelProvider.notifier).getProducts();
    }
  }

  _onPressedTransactionButton(BuildContext context) {
    Navigator.pushNamed(context, Routes.transactionsRoute);
  }

  _onPressedFilterButton(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (_) => ProductsFilterBottomSheet(ref: ref),
    );
  }
}
