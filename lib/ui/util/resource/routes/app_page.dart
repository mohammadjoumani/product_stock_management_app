import 'package:flutter/material.dart';
import '../../../../ui/util/resource/routes/routes_manager.dart';

class AppPage {
  final String route;
  final Widget screen;
  // final BaseBinding? binding;

  AppPage({
    required this.route,
    required this.screen,
    // this.binding,
  });

  Route<dynamic> generateRoute(RouteSettings settings) {
    setArgs(route, settings.arguments);
    // if (binding != null) {
    //   binding!.dependencies();
    // }
    return MaterialPageRoute(
      builder: (_) => screen,
    );
  }
}
