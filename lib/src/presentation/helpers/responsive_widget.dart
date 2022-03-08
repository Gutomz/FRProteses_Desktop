import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreenWidget;
  final Widget? mediumScreenWidget;
  final Widget? smallScreenWidget;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreenWidget,
    this.mediumScreenWidget,
    this.smallScreenWidget,
  }) : super(key: key);

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenSize;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < largeScreenSize &&
      MediaQuery.of(context).size.width >= mediumScreenSize;

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final _width = constraints.maxWidth;

        if (_width >= largeScreenSize) {
          return largeScreenWidget;
        } else if (_width >= mediumScreenSize) {
          return mediumScreenWidget ?? largeScreenWidget;
        } else {
          return smallScreenWidget ?? largeScreenWidget;
        }
      },
    );
  }
}
