import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'navigation_store.g.dart';

class NavigationStore = _NavigationStoreBase with _$NavigationStore;

abstract class _NavigationStoreBase with Store {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  Future? navigateTo(String routeName) {
    return navigationKey.currentState?.pushNamed(routeName);
  }

  void goBack() => navigationKey.currentState?.pop();
}
