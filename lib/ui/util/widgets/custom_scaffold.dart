import 'package:flutter/material.dart';
import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.canPop = true,
    this.onPopInvoked,
    this.appBar,
    this.body,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  });

  final bool canPop;
  final Function? onPopInvoked;
  final AppBar? appBar;
  final Widget? body;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          if (onPopInvoked != null) {
            onPopInvoked!();
          }
        }
      },
      child: Scaffold(
        backgroundColor: colorBackgroundScaffold,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        appBar: appBar,
        body: body == null ? body : SafeArea(child: body!),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
