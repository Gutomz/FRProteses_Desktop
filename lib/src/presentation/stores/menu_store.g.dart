// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuStore on _MenuStoreBase, Store {
  final _$activeItemAtom = Atom(name: '_MenuStoreBase.activeItem');

  @override
  String get activeItem {
    _$activeItemAtom.reportRead();
    return super.activeItem;
  }

  @override
  set activeItem(String value) {
    _$activeItemAtom.reportWrite(value, super.activeItem, () {
      super.activeItem = value;
    });
  }

  final _$hoverItemAtom = Atom(name: '_MenuStoreBase.hoverItem');

  @override
  String get hoverItem {
    _$hoverItemAtom.reportRead();
    return super.hoverItem;
  }

  @override
  set hoverItem(String value) {
    _$hoverItemAtom.reportWrite(value, super.hoverItem, () {
      super.hoverItem = value;
    });
  }

  final _$_MenuStoreBaseActionController =
      ActionController(name: '_MenuStoreBase');

  @override
  void changeActiveItemTo(String itemName) {
    final _$actionInfo = _$_MenuStoreBaseActionController.startAction(
        name: '_MenuStoreBase.changeActiveItemTo');
    try {
      return super.changeActiveItemTo(itemName);
    } finally {
      _$_MenuStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onHover(String itemName) {
    final _$actionInfo = _$_MenuStoreBaseActionController.startAction(
        name: '_MenuStoreBase.onHover');
    try {
      return super.onHover(itemName);
    } finally {
      _$_MenuStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeItem: ${activeItem},
hoverItem: ${hoverItem}
    ''';
  }
}
