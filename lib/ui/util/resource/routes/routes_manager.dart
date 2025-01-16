import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/add_product/view/add_product_view.dart';
import 'package:product_stock_management_app/ui/onboarding/view/on_boarding_view.dart';
import 'package:product_stock_management_app/ui/products/view/products_view.dart';
import 'package:product_stock_management_app/ui/splash/view/splash_view.dart';
import 'package:product_stock_management_app/ui/transactions/view/transactions_view.dart';

import 'app_page.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String productsRoute = "/products";
  static const String addProductRoute = "/add_product";
  static const String transactionsRoute = "/transactions";
}

Map<String, dynamic> _arguments = {};

dynamic getArgs(String key) => _arguments[key];

void setArgs(String key, dynamic value) => _arguments[key] = value;

class RouteGenerator {
  static final List<AppPage> appPages = [
    AppPage(
      route: Routes.splashRoute,
      screen: const SplashView(),
      // binding: SplashBinding(),
    ),
    AppPage(
      route: Routes.onboardingRoute,
      screen: const OnBoardingView(),
      // binding: OnBoardingBinding(),
    ),
    AppPage(
      route: Routes.productsRoute,
      screen: const ProductsView(),
    ),
    AppPage(
      route: Routes.addProductRoute,
      screen: const AddProductView(),
    ),
    AppPage(
      route: Routes.transactionsRoute,
      screen: const TransactionsView(),
    ),
  ];

  static Route<dynamic> getRoute(RouteSettings settings) {
    for (var page in appPages) {
      if (page.route == settings.name) {
        return page.generateRoute(settings);
      }
    }
    return unDefinedRoute();
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Not found data"),
        ),
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Not found data",
                style: TextStyle(
                  color: Color(0xFFA0A0A0),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension NavigationExtension on BuildContext {
  void navigateTo(String routeName, {Object? arguments}) {
    Navigator.pushNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }
}
