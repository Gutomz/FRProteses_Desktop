import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/presentation/config/routes.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/stores/menu_store.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';
import 'package:frproteses/src/presentation/widgets/menu_item_widget.dart';

class Menu extends StatelessWidget {
  final MenuStore _menuStore = sl();
  final NavigationStore _navigationStore = sl();

  Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Material(
      elevation: 10,
      child: Container(
        color: Theme.of(context).canvasColor,
        child: ListView(
          children: [
            if (ResponsiveWidget.isSmallScreen(context))
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(width: _width / 48),
                      Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(Icons.abc_rounded),
                      ),
                      Flexible(
                        child: Text(
                          "Dashboard",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(width: _width / 48),
                    ],
                  ),
                  SizedBox(height: 40),
                  Divider(color: Theme.of(context).dividerColor, height: 1),
                ],
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: mainRoutes
                  .map(
                    (itemName) => MenuItem(
                      itemName: itemName,
                      icon: _getIconDataFor(itemName),
                      onTap: () => _onTapMenuItem(context, itemName),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconDataFor(String itemName) {
    switch (itemName) {
      case customerPageRoute:
        return Icons.person;
      case providerPageRoute:
        return Icons.add_business;
      case productPageRoute:
        return Icons.fastfood;
      case orderPageRoute:
        return Icons.shopping_cart_rounded;
      case paymentPageRoute:
        return Icons.account_balance_wallet_rounded;
      case overviewPageRoute:
      default:
        return Icons.home;
    }
  }

  void _onTapMenuItem(BuildContext context, String itemName) {
    if (!_menuStore.isActive(itemName)) {
      _menuStore.changeActiveItemTo(itemName);

      if (ResponsiveWidget.isSmallScreen(context)) {
        Navigator.of(context).pop();
      }

      _navigationStore.navigateTo(itemName);
    }
  }
}
