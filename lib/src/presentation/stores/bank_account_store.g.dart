// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BankAccountStore on _BankAccountStoreBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_BankAccountStoreBase.isLoading'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_BankAccountStoreBase.hasError'))
          .value;
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: '_BankAccountStoreBase.errorMessage'))
          .value;

  final _$_errorMessageAtom = Atom(name: '_BankAccountStoreBase._errorMessage');

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

  final _$_loadingAtom = Atom(name: '_BankAccountStoreBase._loading');

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

  final _$getAllAsyncAction = AsyncAction('_BankAccountStoreBase.getAll');

  @override
  Future<List<BankAccountEntity>?> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$getByIdAsyncAction = AsyncAction('_BankAccountStoreBase.getById');

  @override
  Future<BankAccountEntity?> getById(String bankAccountId) {
    return _$getByIdAsyncAction.run(() => super.getById(bankAccountId));
  }

  final _$setAsyncAction = AsyncAction('_BankAccountStoreBase.set');

  @override
  Future<BankAccountEntity?> set(BankAccountEntity bankAccountEntity) {
    return _$setAsyncAction.run(() => super.set(bankAccountEntity));
  }

  final _$getNextIdAsyncAction = AsyncAction('_BankAccountStoreBase.getNextId');

  @override
  Future<int?> getNextId() {
    return _$getNextIdAsyncAction.run(() => super.getNextId());
  }

  final _$payAsyncAction = AsyncAction('_BankAccountStoreBase.pay');

  @override
  Future<void> pay(int customerId, double amount) {
    return _$payAsyncAction.run(() => super.pay(customerId, amount));
  }

  final _$chargeAsyncAction = AsyncAction('_BankAccountStoreBase.charge');

  @override
  Future<void> charge(int customerId, double amount) {
    return _$chargeAsyncAction.run(() => super.charge(customerId, amount));
  }

  final _$reportAsyncAction = AsyncAction('_BankAccountStoreBase.report');

  @override
  Future<void> report(int customerId) {
    return _$reportAsyncAction.run(() => super.report(customerId));
  }

  final _$_BankAccountStoreBaseActionController =
      ActionController(name: '_BankAccountStoreBase');

  @override
  void _setErrorMessage(Failure? failure) {
    final _$actionInfo = _$_BankAccountStoreBaseActionController.startAction(
        name: '_BankAccountStoreBase._setErrorMessage');
    try {
      return super._setErrorMessage(failure);
    } finally {
      _$_BankAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _startLoading() {
    final _$actionInfo = _$_BankAccountStoreBaseActionController.startAction(
        name: '_BankAccountStoreBase._startLoading');
    try {
      return super._startLoading();
    } finally {
      _$_BankAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _stopLoading() {
    final _$actionInfo = _$_BankAccountStoreBaseActionController.startAction(
        name: '_BankAccountStoreBase._stopLoading');
    try {
      return super._stopLoading();
    } finally {
      _$_BankAccountStoreBaseActionController.endAction(_$actionInfo);
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
