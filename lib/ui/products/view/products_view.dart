import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/routes/routes_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_scaffold.dart';

import 'widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.filter_alt),
          onPressed: () {
            // Navigator.of(context).pop();
          },
        ),
        title: const Text("Products"),
        actions: [
          IconButton(
            icon: const Icon(Icons.sunny),
            onPressed: () {
              // Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: const ProductsViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onPressedAddButton(context),
        backgroundColor: colorPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }

  _onPressedAddButton(BuildContext context) {
    Navigator.pushNamed(context, Routes.addProductRoute);
  }
}
