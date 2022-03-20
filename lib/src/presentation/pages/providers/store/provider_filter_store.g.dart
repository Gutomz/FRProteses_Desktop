// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProviderFilterStore on _ProviderFilterStoreBase, Store {
  Computed<String>? _$idComputed;

  @override
  String get id => (_$idComputed ??=
          Computed<String>(() => super.id, name: '_ProviderFilterStoreBase.id'))
      .value;
  Computed<String>? _$fullNameComputed;

  @override
  String get fullName =>
      (_$fullNameComputed ??= Computed<String>(() => super.fullName,
              name: '_ProviderFilterStoreBase.fullName'))
          .value;
  Computed<List<Filter>>? _$filtersComputed;

  @override
  List<Filter> get filters =>
      (_$filtersComputed ??= Computed<List<Filter>>(() => super.filters,
              name: '_ProviderFilterStoreBase.filters'))
          .value;

  final _$_idAtom = Atom(name: '_ProviderFilterStoreBase._id');

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

  final _$_fullNameAtom = Atom(name: '_ProviderFilterStoreBase._fullName');

  @override
  String get _fullName {
    _$_fullNameAtom.reportRead();
    return super._fullName;
  }

  @override
  set _fullName(String value) {
    _$_fullNameAtom.reportWrite(value, super._fullName, () {
      super._fullName = value;
    });
  }

  final _$_idFilterAtom = Atom(name: '_ProviderFilterStoreBase._idFilter');

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

  final _$_fullNameFilterAtom =
      Atom(name: '_ProviderFilterStoreBase._fullNameFilter');

  @override
  String get _fullNameFilter {
    _$_fullNameFilterAtom.reportRead();
    return super._fullNameFilter;
  }

  @override
  set _fullNameFilter(String value) {
    _$_fullNameFilterAtom.reportWrite(value, super._fullNameFilter, () {
      super._fullNameFilter = value;
    });
  }

  final _$isFilterAppliedAtom =
      Atom(name: '_ProviderFilterStoreBase.isFilterApplied');

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

  final _$_ProviderFilterStoreBaseActionController =
      ActionController(name: '_ProviderFilterStoreBase');

  @override
  void setId(String value) {
    final _$actionInfo = _$_ProviderFilterStoreBaseActionController.startAction(
        name: '_ProviderFilterStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_ProviderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFullName(String value) {
    final _$actionInfo = _$_ProviderFilterStoreBaseActionController.startAction(
        name: '_ProviderFilterStoreBase.setFullName');
    try {
      return super.setFullName(value);
    } finally {
      _$_ProviderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveFilters() {
    final _$actionInfo = _$_ProviderFilterStoreBaseActionController.startAction(
        name: '_ProviderFilterStoreBase.saveFilters');
    try {
      return super.saveFilters();
    } finally {
      _$_ProviderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFilters() {
    final _$actionInfo = _$_ProviderFilterStoreBaseActionController.startAction(
        name: '_ProviderFilterStoreBase.resetFilters');
    try {
      return super.resetFilters();
    } finally {
      _$_ProviderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetIdFilter() {
    final _$actionInfo = _$_ProviderFilterStoreBaseActionController.startAction(
        name: '_ProviderFilterStoreBase.resetIdFilter');
    try {
      return super.resetIdFilter();
    } finally {
      _$_ProviderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFullNameFilter() {
    final _$actionInfo = _$_ProviderFilterStoreBaseActionController.startAction(
        name: '_ProviderFilterStoreBase.resetFullNameFilter');
    try {
      return super.resetFullNameFilter();
    } finally {
      _$_ProviderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFilterApplied: ${isFilterApplied},
id: ${id},
fullName: ${fullName},
filters: ${filters}
    ''';
  }
}
