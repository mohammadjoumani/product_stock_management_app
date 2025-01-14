import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    super.key,
    required this.currentIndex,
    required this.index,
  });

  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s10,
      width: currentIndex == index ? AppSize.s20 : AppSize.s10,
      margin: const EdgeInsets.only(right: AppPadding.p4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s20),
        color: currentIndex == index ? colorPrimary : colorDisable,
      ),
    );
  }
}
