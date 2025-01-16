import 'package:flutter/material.dart';
import 'package:product_stock_management_app/model/product.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: _stockBackgroundColor(),
        padding: const EdgeInsets.all(AppPadding.p6),
        child: Row(
          children: [
            Expanded(child: _itemCell(product.id.toString())),
            Expanded(child: _itemCell(product.name)),
            Expanded(child: _itemCell(product.price.toString())),
            Expanded(child: _itemCell(product.quantity.toString())),
            Expanded(child: _itemCell(_stockText(product.status))),
          ],
        ),
      ),
    );
  }

  Widget _itemCell(String value) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p2),
      child: Text(
        value,
        style: Styles.getRegularStyle(
          color: _stockTextColor(),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  String _stockText(ProductStatus state) {
    switch (state) {
      case ProductStatus.inStock:
        return 'In Stock';
      case ProductStatus.outStock:
        return 'Out Stock';
      case ProductStatus.lowStock:
        return 'Low Stock';
    }
  }

  Color _stockBackgroundColor() {
    switch (product.status) {
      case ProductStatus.inStock:
        return Colors.transparent;
      case ProductStatus.outStock:
        return colorError;
      case ProductStatus.lowStock:
        return Colors.amber;
    }
  }

  Color _stockTextColor() {
    switch (product.status) {
      case ProductStatus.inStock:
        return colorOnBackgroundCard;
      case ProductStatus.outStock:
        return colorOnError;
      case ProductStatus.lowStock:
        return colorOnError;
    }
  }
}
