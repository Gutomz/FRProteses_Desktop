// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductFilterStore on _ProductFilterStoreBase, Store {
  Computed<String>? _$idComputed;

  @override
  String get id => (_$idComputed ??=
          Computed<String>(() => super.id, name: '_ProductFilterStoreBase.id'))
      .value;
  Computed<String>? _$nameComputed;

  @override
  String get name => (_$nameComputed ??= Computed<String>(() => super.name,
          name: '_ProductFilterStoreBase.name'))
      .value;
  Computed<String>? _$priceComputed;

  @override
  String get price => (_$priceComputed ??= Computed<String>(() => super.price,
          name: '_ProductFilterStoreBase.price'))
      .value;
  Computed<List<Filter>>? _$filtersComputed;

  @override
  List<Filter> get filters =>
      (_$filtersComputed ??= Computed<List<Filter>>(() => super.filters,
              name: '_ProductFilterStoreBase.filters'))
          .value;

  final _$_idAtom = Atom(name: '_ProductFilterStoreBase._id');

  @override
  String get _id {
    _$_idAtom.reportRead();
    return super._id;
  }

  @override
  set _id(String value) {
    _$_idAtom.reportWrite(value, super._id, () {
      super._id = value;
    });
  }

  final _$_nameAtom = Atom(name: '_ProductFilterStoreBase._name');

  @override
  String get _name {
    _$_nameAtom.reportRead();
    return super._name;
  }

  @override
  set _name(String value) {
    _$_nameAtom.reportWrite(value, super._name, () {
      super._name = value;
    });
  }

  final _$_priceAtom = Atom(name: '_ProductFilterStoreBase._price');

  @override
  String get _price {
    _$_priceAtom.reportRead();
    return super._price;
  }

  @override
  set _price(String value) {
    _$_priceAtom.reportWrite(value, super._price, () {
      super._price = value;
    });
  }

  final _$_idFilterAtom = Atom(name: '_ProductFilterStoreBase._idFilter');

  @override
  String get _idFilter {
    _$_idFilterAtom.reportRead();
    return super._idFilter;
  }

  @override
  set _idFilter(String value) {
    _$_idFilterAtom.reportWrite(value, super._idFilter, () {
      super._idFilter = value;
    });
  }

  final _$_nameFilterAtom = Atom(name: '_ProductFilterStoreBase._nameFilter');

  @override
  String get _nameFilter {
    _$_nameFilterAtom.reportRead();
    return super._nameFilter;
  }

  @override
  set _nameFilter(String value) {
    _$_nameFilterAtom.reportWrite(value, super._nameFilter, () {
      super._nameFilter = value;
    });
  }

  final _$_priceFilterAtom = Atom(name: '_ProductFilterStoreBase._priceFilter');

  @override
  String get _priceFilter {
    _$_priceFilterAtom.reportRead();
    return super._priceFilter;
  }

  @override
  set _priceFilter(String value) {
    _$_priceFilterAtom.reportWrite(value, super._priceFilter, () {
      super._priceFilter = value;
    });
  }

  final _$isFilterAppliedAtom =
      Atom(name: '_ProductFilterStoreBase.isFilterApplied');

  @override
  bool get isFilterApplied {
    _$isFilterAppliedAtom.reportRead();
    return super.isFilterApplied;
  }

  @override
  set isFilterApplied(bool value) {
    _$isFilterAppliedAtom.reportWrite(value, super.isFilterApplied, () {
      super.isFilterApplied = value;
    });
  }

  final _$_ProductFilterStoreBaseActionController =
      ActionController(name: '_ProductFilterStoreBase');

  @override
  void setId(String value) {
    final _$actionInfo = _$_ProductFilterStoreBaseActionController.startAction(
        name: '_ProductFilterStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_ProductFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_ProductFilterStoreBaseActionController.startAction(
        name: '_ProductFilterStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ProductFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_ProductFilterStoreBaseActionController.startAction(
        name: '_ProductFilterStoreBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_ProductFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveFilters() {
    final _$actionInfo = _$_ProductFilterStoreBaseActionController.startAction(
        name: '_ProductFilterStoreBase.saveFilters');
    try {
      return super.saveFilters();
    } finally {
      _$_ProductFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFilters() {
    final _$actionInfo = _$_ProductFilterStoreBaseActionController.startAction(
        name: '_ProductFilterStoreBase.resetFilters');
    try {
      return super.resetFilters();
    } finally {
      _$_ProductFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetIdFilter() {
    final _$actionInfo = _$_ProductFilterStoreBaseActionController.startAction(
        name: '_ProductFilterStoreBase.resetIdFilter');
    try {
      return super.resetIdFilter();
    } finally {
      _$_ProductFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetNameFilter() {
    final _$actionInfo = _$_ProductFilterStoreBaseActionController.startAction(
        name: '_ProductFilterStoreBase.resetNameFilter');
    try {
      return super.resetNameFilter();
    } finally {
      _$_ProductFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPriceFilter() {
    final _$actionInfo = _$_ProductFilterStoreBaseActionController.startAction(
        name: '_ProductFilterStoreBase.resetPriceFilter');
    try {
      return super.resetPriceFilter();
    } finally {
      _$_ProductFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFilterApplied: ${isFilterApplied},
id: ${id},
name: ${name},
price: ${price},
filters: ${filters}
    ''';
  }
}
