import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:product_stock_management_app/ui/util/resource/font_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/language_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/routes/routes_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/theme_manager.dart';

import 'widgets/main_app_body.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Product Stock Management',
      builder: (BuildContext context, Widget? child) {
        return MainAppBody(
          fontSize: 1,
          child: child!,
        );
      },
      // locale: state.locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (deviceLocale != null && deviceLocale.languageCode == locale.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: ThemeAppManager().getThemeData(
        fontFamily: FontConstants.fontLato,
      ),
    );
  }
}
