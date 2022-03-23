// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrdersPageStore on _OrdersPageStoreBase, Store {
  Computed<List<OrderEntity>>? _$_filteredDataComputed;

  @override
  List<OrderEntity> get _filteredData => (_$_filteredDataComputed ??=
          Computed<List<OrderEntity>>(() => super._filteredData,
              name: '_OrdersPageStoreBase._filteredData'))
      .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_OrdersPageStoreBase.isLoading'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_OrdersPageStoreBase.hasError'))
          .value;
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: '_OrdersPageStoreBase.errorMessage'))
          .value;
  Computed<List<OrderEntity>>? _$dataComputed;

  @override
  List<OrderEntity> get data =>
      (_$dataComputed ??= Computed<List<OrderEntity>>(() => super.data,
              name: '_OrdersPageStoreBase.data'))
          .value;
  Computed<int?>? _$sortColumnIndexComputed;

  @override
  int? get sortColumnIndex =>
      (_$sortColumnIndexComputed ??= Computed<int?>(() => super.sortColumnIndex,
              name: '_OrdersPageStoreBase.sortColumnIndex'))
          .value;
  Computed<bool>? _$sortAscendingComputed;

  @override
  bool get sortAscending =>
      (_$sortAscendingComputed ??= Computed<bool>(() => super.sortAscending,
              name: '_OrdersPageStoreBase.sortAscending'))
          .value;

  final _$_loadingAtom = Atom(name: '_OrdersPageStoreBase._loading');

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
      Atom(name: '_OrdersPageStoreBase._sortColumnIndex');

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
      Atom(name: '_OrdersPageStoreBase._sortAscending');

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

  final _$createNewAsyncAction = AsyncAction('_OrdersPageStoreBase.createNew');

  @override
  Future<OrderEntity?> createNew() {
    return _$createNewAsyncAction.run(() => super.createNew());
  }

  final _$loadAllAsyncAction = AsyncAction('_OrdersPageStoreBase.loadAll');

  @override
  Future<List<OrderEntity>?> loadAll() {
    return _$loadAllAsyncAction.run(() => super.loadAll());
  }

  final _$_OrdersPageStoreBaseActionController =
      ActionController(name: '_OrdersPageStoreBase');

  @override
  void _startLoading() {
    final _$actionInfo = _$_OrdersPageStoreBaseActionController.startAction(
        name: '_OrdersPageStoreBase._startLoading');
    try {
      return super._startLoading();
    } finally {
      _$_OrdersPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _stopLoading() {
    final _$actionInfo = _$_OrdersPageStoreBaseActionController.startAction(
        name: '_OrdersPageStoreBase._stopLoading');
    try {
      return super._stopLoading();
    } finally {
      _$_OrdersPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortColumnIndex(int index, {bool isAscending = true}) {
    final _$actionInfo = _$_OrdersPageStoreBaseActionController.startAction(
        name: '_OrdersPageStoreBase.setSortColumnIndex');
    try {
      return super.setSortColumnIndex(index, isAscending: isAscending);
    } finally {
      _$_OrdersPageStoreBaseActionController.endAction(_$actionInfo);
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
