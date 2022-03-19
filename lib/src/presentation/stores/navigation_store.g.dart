// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationStore on _NavigationStoreBase, Store {
  Computed<bool>? _$hasStackedRoutesComputed;

  @override
  bool get hasStackedRoutes => (_$hasStackedRoutesComputed ??= Computed<bool>(
          () => super.hasStackedRoutes,
          name: '_NavigationStoreBase.hasStackedRoutes'))
      .value;

  final _$currentRouteNameAtom =
      Atom(name: '_NavigationStoreBase.currentRouteName');

  @override
  String get currentRouteName {
    _$currentRouteNameAtom.reportRead();
    return super.currentRouteName;
  }

  @override
  set currentRouteName(String value) {
    _$currentRouteNameAtom.reportWrite(value, super.currentRouteName, () {
      super.currentRouteName = value;
    });
  }

  final _$_NavigationStoreBaseActionController =
      ActionController(name: '_NavigationStoreBase');

  @override
  void _setCurrentRouteName(String name) {
    final _$actionInfo = _$_NavigationStoreBaseActionController.startAction(
        name: '_NavigationStoreBase._setCurrentRouteName');
    try {
      return super._setCurrentRouteName(name);
    } finally {
      _$_NavigationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentRouteName: ${currentRouteName},
hasStackedRoutes: ${hasStackedRoutes}
    ''';
  }
}
