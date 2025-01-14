import 'package:flutter/material.dart';

class MainAppBody extends StatelessWidget {
  const MainAppBody({
    super.key,
    required this.fontSize,
    required this.child,
  });

  final double fontSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(fontSize),
      ),
      child: child,
    );
  }
}
