// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomerStore on _CustomerStoreBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_CustomerStoreBase.isLoading'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_CustomerStoreBase.hasError'))
          .value;
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: '_CustomerStoreBase.errorMessage'))
          .value;

  final _$_errorMessageAtom = Atom(name: '_CustomerStoreBase._errorMessage');

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

  final _$_loadingAtom = Atom(name: '_CustomerStoreBase._loading');

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

  final _$getAllAsyncAction = AsyncAction('_CustomerStoreBase.getAll');

  @override
  Future<List<CustomerEntity>?> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$getByIdAsyncAction = AsyncAction('_CustomerStoreBase.getById');

  @override
  Future<CustomerEntity?> getById(String customerId) {
    return _$getByIdAsyncAction.run(() => super.getById(customerId));
  }

  final _$setAsyncAction = AsyncAction('_CustomerStoreBase.set');

  @override
  Future<CustomerEntity?> set(CustomerEntity customerEntity) {
    return _$setAsyncAction.run(() => super.set(customerEntity));
  }

  final _$getNextIdAsyncAction = AsyncAction('_CustomerStoreBase.getNextId');

  @override
  Future<int?> getNextId() {
    return _$getNextIdAsyncAction.run(() => super.getNextId());
  }

  final _$_CustomerStoreBaseActionController =
      ActionController(name: '_CustomerStoreBase');

  @override
  void _setErrorMessage(Failure? failure) {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase._setErrorMessage');
    try {
      return super._setErrorMessage(failure);
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _startLoading() {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase._startLoading');
    try {
      return super._startLoading();
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _stopLoading() {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase._stopLoading');
    try {
      return super._stopLoading();
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
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
