import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_button.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_scaffold.dart';

import 'widgets/add_product_view.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

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
        title: const Text("Add Product"),
      ),
      body: const AddProductViewBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: CustomButton(
          label: 'Add product',
          onPressed: () => _onPressedAddProductButton(context),
        ),
      ),
    );
  }

  _onPressedAddProductButton(BuildContext context) {}
}
