import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  final NavigationStore _navigationStore = sl();

  return AppBar(
    leadingWidth: MediaQuery.of(context).size.width / 6,
    leading: ResponsiveWidget.isSmallScreen(context)
        ? null
        : Center(
            child: Text(
              "FRPróteses",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
    actions: [
      if (ResponsiveWidget.isSmallScreen(context))
        IconButton(
          onPressed: () => key.currentState?.openEndDrawer(),
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
    ],
    elevation: 5,
    backgroundColor: Theme.of(context).canvasColor,
    titleSpacing: 16,
    title: Observer(
      builder: (_) {
        return Row(
          children: [
            if (_navigationStore.hasStackedRoutes)
              IconButton(
                onPressed: _navigationStore.goBack,
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color,
                ),
                splashRadius: 20,
                splashColor: Theme.of(context).splashColor,
                hoverColor: Theme.of(context).splashColor.withOpacity(0.1),
                highlightColor: Theme.of(context).splashColor.withOpacity(0.4),
              ),
            if (_navigationStore.hasStackedRoutes) SizedBox(width: 5),
            Text(
              _navigationStore.currentRouteName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        );
      },
    ),
  );
}
