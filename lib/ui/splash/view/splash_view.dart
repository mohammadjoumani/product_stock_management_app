import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_scaffold.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SplashViewBody(),
    );
  }
}
