import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_stock_management_app/core/services/app_preferences.dart';
import 'package:product_stock_management_app/core/util/extension/widget_extension.dart';
import 'package:product_stock_management_app/ui/onboarding/viewmodel/current_index_provider.dart';
import 'package:product_stock_management_app/ui/util/resource/routes/routes_manager.dart';
import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';
import 'package:product_stock_management_app/ui/util/widgets/custom_button.dart';
import 'package:product_stock_management_app/ui/util/widgets/margin.dart';

import 'dot_widgets.dart';
import 'page_1.dart';
import 'page_2.dart';
import 'page_3.dart';

class OnBoardingViewBody extends ConsumerStatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  ConsumerState<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends ConsumerState<OnBoardingViewBody> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(indexOnBoardingProvider);
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              ref.read(indexOnBoardingProvider.notifier).state = value;
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return index == 0
                  ? const PageOne()
                  : index == 1
                      ? const PageTwo()
                      : const PageThree();
            },
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotWidget(currentIndex: currentIndex, index: 0),
                DotWidget(currentIndex: currentIndex, index: 1),
                DotWidget(currentIndex: currentIndex, index: 2),
              ],
            ),
            const Sh5(),
            CustomButton(
              onPressed: () => _onPressedNextButton(context, currentIndex),
              label: currentIndex == 0
                  ? "Get Start"
                  : currentIndex == 1
                      ? "Next"
                      : "Go to home",
            )
          ],
        ),
      ],
    ).marginSymmetric(horizontal: AppPadding.p16, vertical: AppPadding.p16);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onPressedNextButton(BuildContext context, int currentIndex) {
    if (currentIndex < 2) {
      _pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
      ref.read(indexOnBoardingProvider.notifier).state = currentIndex + 1;
      return;
    }
    final appPref = ref.read(appPreferencesProvider.future);
    appPref.then((value) {
      value.setOnBoardingScreenViewed();
      Navigator.pushReplacementNamed(context, Routes.productsRoute);
    });
  }
}
