import 'package:flutter/cupertino.dart';
import 'package:frproteses/src/presentation/config/routes.dart';
import 'package:mobx/mobx.dart';
part 'navigation_store.g.dart';

class NavigationStore = _NavigationStoreBase with _$NavigationStore;

abstract class _NavigationStoreBase with Store {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  @observable
  String currentRouteName = "";

  final ObservableList<String> _localStack = ObservableList();

  @action
  void _setCurrentRouteName(String name) => currentRouteName = name;

  Future? navigateTo(String routeName, {Object? arguments}) {
    if (navigationKey.currentState != null) {
      _setCurrentRouteName(routeName);

      if (_localStack.isNotEmpty && isMainRoute(routeName)) {
        _localStack.clear();
      }

      _localStack.add(routeName);
    }

    return navigationKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  void goBack() {
    if (navigationKey.currentState != null &&
        navigationKey.currentState!.canPop()) {
      if (_localStack.length > 1) {
        navigationKey.currentState?.popUntil((route) =>
            route.settings.name == _localStack[_localStack.length - 2]);
      } else {
        navigationKey.currentState?.pop();
      }

      if (_localStack.isNotEmpty) {
        _localStack.removeLast();
        _setCurrentRouteName(_localStack.last);
      }
    }
  }

  @computed
  bool get hasStackedRoutes => _localStack.isNotEmpty && _localStack.length > 1;
}
