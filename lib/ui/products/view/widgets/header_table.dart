import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/font_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';

class HeaderTable extends StatelessWidget {
  const HeaderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      padding: const EdgeInsets.all(AppPadding.p6),
      child: Row(
        children: [
          Expanded(child: _itemCell("ID")),
          Expanded(child: _itemCell('Name')),
          Expanded(child: _itemCell('Price')),
          Expanded(child: _itemCell('Quantity')),
          Expanded(child: _itemCell('Status')),
        ],
      ),
    );
  }

  Widget _itemCell(String value) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p2),
      child: Text(
        value,
        style: Styles.getBoldStyle(
          color: colorOnPrimary,
          fontSize: FontSize.s16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
