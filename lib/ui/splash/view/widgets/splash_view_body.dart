import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/core/services/app_preferences.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/routes/routes_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';

class SplashViewBody extends ConsumerStatefulWidget {
  const SplashViewBody({super.key});

  @override
  ConsumerState<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends ConsumerState<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goNext();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Easy stock'.toUpperCase(),
                style: Styles.getBoldStyle(
                  color: colorPrimary,
                  fontSize: AppSize.s44,
                ).copyWith(letterSpacing: 3),
              ),
              Text(
                "Simplify your inventory, streamline your success",
                textAlign: TextAlign.center,
                style: Styles.getRegularStyle(
                  color: colorDisable,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _goNext() {
    final appPref = ref.read(appPreferencesProvider.future);
    appPref.then((value) {
      if (value.isOnBoardingScreenViewed()) {
        Navigator.pushReplacementNamed(context, Routes.productsRoute);
      } else {
        Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
      }
    });
  }
}
