import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/add_product/view/widgets/add_product_button.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_scaffold.dart';

import 'widgets/add_product_view_body.dart';

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
      bottomNavigationBar: const AddProductButton(),
    );
  }
}
