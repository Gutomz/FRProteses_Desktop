import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/presentation/config/style.dart';
import 'package:frproteses/src/presentation/stores/menu_store.dart';

class MenuIcon extends StatelessWidget {
  final MenuStore _menuStore = sl();

  final IconData icon;
  final String itemName;

  MenuIcon({
    Key? key,
    required this.icon,
    required this.itemName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_menuStore.isActive(itemName)) {
          return Icon(
            icon,
            color: Theme.of(context).focusColor,
          );
        }

        return Icon(
          icon,
          color: _menuStore.isHovering(itemName)
              ? Theme.of(context).hoverColor
              : Theme.of(context).shadowColor,
        );
      },
    );
  }
}
