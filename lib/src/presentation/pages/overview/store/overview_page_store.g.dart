// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OverviewPageStore on _OverviewPageStoreBase, Store {
  Computed<List<BankAccountEntity>>? _$bankAccountsComputed;

  @override
  List<BankAccountEntity> get bankAccounts => (_$bankAccountsComputed ??=
          Computed<List<BankAccountEntity>>(() => super.bankAccounts,
              name: '_OverviewPageStoreBase.bankAccounts'))
      .value;
  Computed<int>? _$ordersCountComputed;

  @override
  int get ordersCount =>
      (_$ordersCountComputed ??= Computed<int>(() => super.ordersCount,
              name: '_OverviewPageStoreBase.ordersCount'))
          .value;
  Computed<double>? _$totalOrdersComputed;

  @override
  double get totalOrders =>
      (_$totalOrdersComputed ??= Computed<double>(() => super.totalOrders,
              name: '_OverviewPageStoreBase.totalOrders'))
          .value;
  Computed<int>? _$paymentsCountComputed;

  @override
  int get paymentsCount =>
      (_$paymentsCountComputed ??= Computed<int>(() => super.paymentsCount,
              name: '_OverviewPageStoreBase.paymentsCount'))
          .value;
  Computed<double>? _$totalPaymentsComputed;

  @override
  double get totalPayments =>
      (_$totalPaymentsComputed ??= Computed<double>(() => super.totalPayments,
              name: '_OverviewPageStoreBase.totalPayments'))
          .value;
  Computed<double>? _$balanceComputed;

  @override
  double get balance =>
      (_$balanceComputed ??= Computed<double>(() => super.balance,
              name: '_OverviewPageStoreBase.balance'))
          .value;
  Computed<bool>? _$isOutstandingComputed;

  @override
  bool get isOutstanding =>
      (_$isOutstandingComputed ??= Computed<bool>(() => super.isOutstanding,
              name: '_OverviewPageStoreBase.isOutstanding'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_OverviewPageStoreBase.isLoading'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_OverviewPageStoreBase.hasError'))
          .value;
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: '_OverviewPageStoreBase.errorMessage'))
          .value;

  final _$selectedBankAccountAtom =
      Atom(name: '_OverviewPageStoreBase.selectedBankAccount');

  @override
  BankAccountEntity? get selectedBankAccount {
    _$selectedBankAccountAtom.reportRead();
    return super.selectedBankAccount;
  }

  @override
  set selectedBankAccount(BankAccountEntity? value) {
    _$selectedBankAccountAtom.reportWrite(value, super.selectedBankAccount, () {
      super.selectedBankAccount = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_OverviewPageStoreBase._loading');

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

  final _$_setInitialValuesAsyncAction =
      AsyncAction('_OverviewPageStoreBase._setInitialValues');

  @override
  Future<void> _setInitialValues() {
    return _$_setInitialValuesAsyncAction.run(() => super._setInitialValues());
  }

  final _$updateBankAccountAsyncAction =
      AsyncAction('_OverviewPageStoreBase.updateBankAccount');

  @override
  Future<void> updateBankAccount(int customerId) {
    return _$updateBankAccountAsyncAction
        .run(() => super.updateBankAccount(customerId));
  }

  final _$_OverviewPageStoreBaseActionController =
      ActionController(name: '_OverviewPageStoreBase');

  @override
  void _startLoading() {
    final _$actionInfo = _$_OverviewPageStoreBaseActionController.startAction(
        name: '_OverviewPageStoreBase._startLoading');
    try {
      return super._startLoading();
    } finally {
      _$_OverviewPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _stopLoading() {
    final _$actionInfo = _$_OverviewPageStoreBaseActionController.startAction(
        name: '_OverviewPageStoreBase._stopLoading');
    try {
      return super._stopLoading();
    } finally {
      _$_OverviewPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedBankAccount(BankAccountEntity? _value) {
    final _$actionInfo = _$_OverviewPageStoreBaseActionController.startAction(
        name: '_OverviewPageStoreBase.setSelectedBankAccount');
    try {
      return super.setSelectedBankAccount(_value);
    } finally {
      _$_OverviewPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedBankAccount: ${selectedBankAccount},
bankAccounts: ${bankAccounts},
ordersCount: ${ordersCount},
totalOrders: ${totalOrders},
paymentsCount: ${paymentsCount},
totalPayments: ${totalPayments},
balance: ${balance},
isOutstanding: ${isOutstanding},
isLoading: ${isLoading},
hasError: ${hasError},
errorMessage: ${errorMessage}
    ''';
  }
}
