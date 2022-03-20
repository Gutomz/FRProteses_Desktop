// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProvidersPageStore on _ProvidersPageStoreBase, Store {
  Computed<List<ProviderEntity>>? _$_filteredDataComputed;

  @override
  List<ProviderEntity> get _filteredData => (_$_filteredDataComputed ??=
          Computed<List<ProviderEntity>>(() => super._filteredData,
              name: '_ProvidersPageStoreBase._filteredData'))
      .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_ProvidersPageStoreBase.isLoading'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_ProvidersPageStoreBase.hasError'))
          .value;
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: '_ProvidersPageStoreBase.errorMessage'))
          .value;
  Computed<List<ProviderEntity>>? _$dataComputed;

  @override
  List<ProviderEntity> get data =>
      (_$dataComputed ??= Computed<List<ProviderEntity>>(() => super.data,
              name: '_ProvidersPageStoreBase.data'))
          .value;
  Computed<int?>? _$sortColumnIndexComputed;

  @override
  int? get sortColumnIndex =>
      (_$sortColumnIndexComputed ??= Computed<int?>(() => super.sortColumnIndex,
              name: '_ProvidersPageStoreBase.sortColumnIndex'))
          .value;
  Computed<bool>? _$sortAscendingComputed;

  @override
  bool get sortAscending =>
      (_$sortAscendingComputed ??= Computed<bool>(() => super.sortAscending,
              name: '_ProvidersPageStoreBase.sortAscending'))
          .value;

  final _$_loadingAtom = Atom(name: '_ProvidersPageStoreBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$_sortColumnIndexAtom =
      Atom(name: '_ProvidersPageStoreBase._sortColumnIndex');

  @override
  int? get _sortColumnIndex {
    _$_sortColumnIndexAtom.reportRead();
    return super._sortColumnIndex;
  }

  @override
  set _sortColumnIndex(int? value) {
    _$_sortColumnIndexAtom.reportWrite(value, super._sortColumnIndex, () {
      super._sortColumnIndex = value;
    });
  }

  final _$_sortAscendingAtom =
      Atom(name: '_ProvidersPageStoreBase._sortAscending');

  @override
  bool get _sortAscending {
    _$_sortAscendingAtom.reportRead();
    return super._sortAscending;
  }

  @override
  set _sortAscending(bool value) {
    _$_sortAscendingAtom.reportWrite(value, super._sortAscending, () {
      super._sortAscending = value;
    });
  }

  final _$createNewAsyncAction =
      AsyncAction('_ProvidersPageStoreBase.createNew');

  @override
  Future<ProviderEntity?> createNew() {
    return _$createNewAsyncAction.run(() => super.createNew());
  }

  final _$loadAllAsyncAction = AsyncAction('_ProvidersPageStoreBase.loadAll');

  @override
  Future<List<ProviderEntity>?> loadAll() {
    return _$loadAllAsyncAction.run(() => super.loadAll());
  }

  final _$_ProvidersPageStoreBaseActionController =
      ActionController(name: '_ProvidersPageStoreBase');

  @override
  void _startLoading() {
    final _$actionInfo = _$_ProvidersPageStoreBaseActionController.startAction(
        name: '_ProvidersPageStoreBase._startLoading');
    try {
      return super._startLoading();
    } finally {
      _$_ProvidersPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _stopLoading() {
    final _$actionInfo = _$_ProvidersPageStoreBaseActionController.startAction(
        name: '_ProvidersPageStoreBase._stopLoading');
    try {
      return super._stopLoading();
    } finally {
      _$_ProvidersPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortColumnIndex(int index, {bool isAscending = true}) {
    final _$actionInfo = _$_ProvidersPageStoreBaseActionController.startAction(
        name: '_ProvidersPageStoreBase.setSortColumnIndex');
    try {
      return super.setSortColumnIndex(index, isAscending: isAscending);
    } finally {
      _$_ProvidersPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasError: ${hasError},
errorMessage: ${errorMessage},
data: ${data},
sortColumnIndex: ${sortColumnIndex},
sortAscending: ${sortAscending}
    ''';
  }
}
