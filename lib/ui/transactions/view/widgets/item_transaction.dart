import 'package:flutter/material.dart';
import 'package:product_stock_management_app/model/transaction.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';

class ItemTransaction extends StatelessWidget {
  const ItemTransaction({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p6),
        child: Row(
          children: [
            Expanded(flex: 1, child: _itemCell(transaction.id.toString())),
            Expanded(flex: 2, child: _itemCell(_getActionType)),
            Expanded(flex: 2, child: _itemCell(transaction.productName)),
            Expanded(flex: 1, child: _itemCell(transaction.quantityChange.toString())),
            Expanded(flex: 2, child: _itemCell(transaction.date)),
          ],
        ),
      ),
    );
  }

  String get _getActionType => transaction.quantityChange >= 0 ? 'Increase' : 'Decrease';

  Color get _getTextColor => transaction.quantityChange >= 0 ? colorOnBackgroundScaffold : colorError;

  Widget _itemCell(String value) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p2),
      child: Text(
        value,
        style: Styles.getRegularStyle(
          color: _getTextColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
