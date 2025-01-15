import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/routes/routes_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_scaffold.dart';

import 'widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        leadingWidth: 200,
        actions: [
          TextButton(
            onPressed: () => _onPressedSkipButton(context),
            child: Text(
              "Skip",
              textAlign: TextAlign.center,
              style: Styles.getSemiBoldStyle(color: colorOnPrimary),
            ),
          ),
        ],
      ),
      body: const OnBoardingViewBody(),
    );
  }

  _onPressedSkipButton(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.productsRoute);
  }
}
