import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: ResponsiveWidget.isSmallScreen(context)
          ? IconButton(
              onPressed: () => key.currentState?.openDrawer(),
              icon: Icon(Icons.menu),
            )
          : Row(),
      elevation: 0,
    );
