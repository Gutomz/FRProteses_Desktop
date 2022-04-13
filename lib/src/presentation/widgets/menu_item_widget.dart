import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/stores/menu_store.dart';
import 'package:frproteses/src/presentation/widgets/menu_icon_widget.dart';

class MenuItem extends StatelessWidget {
  final MenuStore _menuStore = sl();

  final String itemName;
  final IconData icon;
  final IconData selectedIcon;
  final Function() onTap;

  MenuItem({
    Key? key,
    required this.itemName,
    required this.icon,
    required this.selectedIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isMediumScreen(context)) {
      return _getVerticalMenuItem(context);
    }

    return _getHorizontalMenuItem(context);
  }

  Widget _getHorizontalMenuItem(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        _menuStore.onHover(value ? itemName : "");
      },
      child: Observer(
        builder: (context) => Container(
          color:
              _menuStore.isActive(itemName) || _menuStore.isHovering(itemName)
                  ? Theme.of(context).highlightColor.withOpacity(.1)
                  : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: _menuStore.isHovering(itemName) ||
                    _menuStore.isActive(itemName),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  child: Container(
                    width: 6,
                    height: 40,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ),
              SizedBox(width: _width / 80),
              Padding(
                padding: EdgeInsets.all(16),
                child: MenuIcon(
                    icon: _menuStore.isActive(itemName) ? selectedIcon : icon,
                    itemName: itemName),
              ),
              if (!_menuStore.isActive(itemName))
                Flexible(
                  child: Text(
                    itemName,
                    style: TextStyle(
                      color: _menuStore.isHovering(itemName)
                          ? Theme.of(context).hoverColor
                          : Theme.of(context).shadowColor,
                    ),
                  ),
                )
              else
                Flexible(
                  child: Text(
                    itemName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getVerticalMenuItem(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        _menuStore.onHover(value ? itemName : "");
      },
      child: Observer(
        builder: (context) => Container(
          color:
              _menuStore.isActive(itemName) || _menuStore.isHovering(itemName)
                  ? Theme.of(context).highlightColor.withOpacity(.1)
                  : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: _menuStore.isHovering(itemName) ||
                    _menuStore.isActive(itemName),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  child: Container(
                    width: 6,
                    height: 72,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                    right: 16,
                    left: 12,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MenuIcon(
                        icon:
                            _menuStore.isActive(itemName) ? selectedIcon : icon,
                        itemName: itemName,
                      ),
                      if (!_menuStore.isActive(itemName))
                        Flexible(
                          child: Text(
                            itemName,
                            style: TextStyle(
                              color: _menuStore.isHovering(itemName)
                                  ? Theme.of(context).hoverColor
                                  : Theme.of(context).shadowColor,
                            ),
                          ),
                        )
                      else
                        Flexible(
                          child: Text(
                            itemName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).focusColor,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
