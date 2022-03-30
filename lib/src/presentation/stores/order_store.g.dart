// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderStore on _OrderStoreBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_OrderStoreBase.isLoading'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_OrderStoreBase.hasError'))
          .value;
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: '_OrderStoreBase.errorMessage'))
          .value;

  final _$_errorMessageAtom = Atom(name: '_OrderStoreBase._errorMessage');

  @override
  String get _errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  set _errorMessage(String value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_OrderStoreBase._loading');

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

  final _$getAllAsyncAction = AsyncAction('_OrderStoreBase.getAll');

  @override
  Future<List<OrderEntity>?> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$getByIdAsyncAction = AsyncAction('_OrderStoreBase.getById');

  @override
  Future<OrderEntity?> getById(String orderId) {
    return _$getByIdAsyncAction.run(() => super.getById(orderId));
  }

  final _$setAsyncAction = AsyncAction('_OrderStoreBase.set');

  @override
  Future<OrderEntity?> set(OrderEntity orderEntity) {
    return _$setAsyncAction.run(() => super.set(orderEntity));
  }

  final _$getNextIdAsyncAction = AsyncAction('_OrderStoreBase.getNextId');

  @override
  Future<int?> getNextId() {
    return _$getNextIdAsyncAction.run(() => super.getNextId());
  }

  final _$closeAsyncAction = AsyncAction('_OrderStoreBase.close');

  @override
  Future<OrderEntity?> close(int orderId) {
    return _$closeAsyncAction.run(() => super.close(orderId));
  }

  final _$_OrderStoreBaseActionController =
      ActionController(name: '_OrderStoreBase');

  @override
  void _setErrorMessage(Failure? failure) {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase._setErrorMessage');
    try {
      return super._setErrorMessage(failure);
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _startLoading() {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase._startLoading');
    try {
      return super._startLoading();
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _stopLoading() {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase._stopLoading');
    try {
      return super._stopLoading();
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasError: ${hasError},
errorMessage: ${errorMessage}
    ''';
  }
}
