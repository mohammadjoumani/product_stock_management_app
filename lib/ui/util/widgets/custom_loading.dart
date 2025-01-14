import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/main_app/view/main_app.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeWidth: AppSize.s2,
    );
  }
}

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary.withOpacity(0.2),
      width: double.infinity,
      height: double.infinity,
      child: const Center(child: CustomLoading()),
    );
  }
}

void fullScreenLoading() {
  final context = navigatorKey!.currentState!.context;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const PopScope(
      canPop: false,
      child: Center(child: CustomLoading()),
    ),
  );
}
