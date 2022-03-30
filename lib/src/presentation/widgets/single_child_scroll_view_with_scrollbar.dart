import 'package:flutter/material.dart';

class SingleChildScrollViewWithScrollbar extends StatelessWidget {
  final ScrollController controller;
  final Widget child;
  final Axis scrollDirection;
  final bool? thumbVisibility;
  final bool? trackVisibility;
  final EdgeInsetsGeometry? padding;

  SingleChildScrollViewWithScrollbar({
    Key? key,
    required this.controller,
    required this.child,
    this.scrollDirection = Axis.vertical,
    this.thumbVisibility,
    this.trackVisibility,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      thumbVisibility: thumbVisibility,
      trackVisibility: trackVisibility,
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: scrollDirection,
        padding: padding,
        child: child,
      ),
    );
  }
}
