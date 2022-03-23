// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentFilterStore on _PaymentFilterStoreBase, Store {
  Computed<String>? _$idComputed;

  @override
  String get id => (_$idComputed ??=
          Computed<String>(() => super.id, name: '_PaymentFilterStoreBase.id'))
      .value;
  Computed<String>? _$customerComputed;

  @override
  String get customer =>
      (_$customerComputed ??= Computed<String>(() => super.customer,
              name: '_PaymentFilterStoreBase.customer'))
          .value;
  Computed<String>? _$dateRangeComputed;

  @override
  String get dateRange =>
      (_$dateRangeComputed ??= Computed<String>(() => super.dateRange,
              name: '_PaymentFilterStoreBase.dateRange'))
          .value;
  Computed<PaymentMethodType?>? _$paymentMethodComputed;

  @override
  PaymentMethodType? get paymentMethod => (_$paymentMethodComputed ??=
          Computed<PaymentMethodType?>(() => super.paymentMethod,
              name: '_PaymentFilterStoreBase.paymentMethod'))
      .value;
  Computed<String>? _$paidValueComputed;

  @override
  String get paidValue =>
      (_$paidValueComputed ??= Computed<String>(() => super.paidValue,
              name: '_PaymentFilterStoreBase.paidValue'))
          .value;
  Computed<List<Filter>>? _$filtersComputed;

  @override
  List<Filter> get filters =>
      (_$filtersComputed ??= Computed<List<Filter>>(() => super.filters,
              name: '_PaymentFilterStoreBase.filters'))
          .value;

  final _$_idAtom = Atom(name: '_PaymentFilterStoreBase._id');

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

  final _$_customerAtom = Atom(name: '_PaymentFilterStoreBase._customer');

  @override
  String get _customer {
    _$_customerAtom.reportRead();
    return super._customer;
  }

  @override
  set _customer(String value) {
    _$_customerAtom.reportWrite(value, super._customer, () {
      super._customer = value;
    });
  }

  final _$_dateRangeAtom = Atom(name: '_PaymentFilterStoreBase._dateRange');

  @override
  String get _dateRange {
    _$_dateRangeAtom.reportRead();
    return super._dateRange;
  }

  @override
  set _dateRange(String value) {
    _$_dateRangeAtom.reportWrite(value, super._dateRange, () {
      super._dateRange = value;
    });
  }

  final _$_paymentMethodAtom =
      Atom(name: '_PaymentFilterStoreBase._paymentMethod');

  @override
  PaymentMethodType? get _paymentMethod {
    _$_paymentMethodAtom.reportRead();
    return super._paymentMethod;
  }

  @override
  set _paymentMethod(PaymentMethodType? value) {
    _$_paymentMethodAtom.reportWrite(value, super._paymentMethod, () {
      super._paymentMethod = value;
    });
  }

  final _$_paidValueAtom = Atom(name: '_PaymentFilterStoreBase._paidValue');

  @override
  String get _paidValue {
    _$_paidValueAtom.reportRead();
    return super._paidValue;
  }

  @override
  set _paidValue(String value) {
    _$_paidValueAtom.reportWrite(value, super._paidValue, () {
      super._paidValue = value;
    });
  }

  final _$_idFilterAtom = Atom(name: '_PaymentFilterStoreBase._idFilter');

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

  final _$_customerFilterAtom =
      Atom(name: '_PaymentFilterStoreBase._customerFilter');

  @override
  String get _customerFilter {
    _$_customerFilterAtom.reportRead();
    return super._customerFilter;
  }

  @override
  set _customerFilter(String value) {
    _$_customerFilterAtom.reportWrite(value, super._customerFilter, () {
      super._customerFilter = value;
    });
  }

  final _$_dateRangeFilterAtom =
      Atom(name: '_PaymentFilterStoreBase._dateRangeFilter');

  @override
  String get _dateRangeFilter {
    _$_dateRangeFilterAtom.reportRead();
    return super._dateRangeFilter;
  }

  @override
  set _dateRangeFilter(String value) {
    _$_dateRangeFilterAtom.reportWrite(value, super._dateRangeFilter, () {
      super._dateRangeFilter = value;
    });
  }

  final _$_paymentMethodFilterAtom =
      Atom(name: '_PaymentFilterStoreBase._paymentMethodFilter');

  @override
  PaymentMethodType? get _paymentMethodFilter {
    _$_paymentMethodFilterAtom.reportRead();
    return super._paymentMethodFilter;
  }

  @override
  set _paymentMethodFilter(PaymentMethodType? value) {
    _$_paymentMethodFilterAtom.reportWrite(value, super._paymentMethodFilter,
        () {
      super._paymentMethodFilter = value;
    });
  }

  final _$_paidValueFilterAtom =
      Atom(name: '_PaymentFilterStoreBase._paidValueFilter');

  @override
  String get _paidValueFilter {
    _$_paidValueFilterAtom.reportRead();
    return super._paidValueFilter;
  }

  @override
  set _paidValueFilter(String value) {
    _$_paidValueFilterAtom.reportWrite(value, super._paidValueFilter, () {
      super._paidValueFilter = value;
    });
  }

  final _$isFilterAppliedAtom =
      Atom(name: '_PaymentFilterStoreBase.isFilterApplied');

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

  final _$_PaymentFilterStoreBaseActionController =
      ActionController(name: '_PaymentFilterStoreBase');

  @override
  void setId(String value) {
    final _$actionInfo = _$_PaymentFilterStoreBaseActionController.startAction(
        name: '_PaymentFilterStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_PaymentFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCustomer(String value) {
    final _$actionInfo = _$_PaymentFilterStoreBaseActionController.startAction(
        name: '_PaymentFilterStoreBase.setCustomer');
    try {
      return super.setCustomer(value);
    } finally {
      _$_PaymentFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateRange(String value) {
    final _$actionInfo = _$_PaymentFilterStoreBaseActionController.startAction(
        name: '_PaymentFilterStoreBase.setDateRange');
    try {
      return super.setDateRange(value);
    } finally {
      _$_PaymentFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaymentMethod(PaymentMethodType? value) {
    final _$actionInfo = _$_PaymentFilterStoreBaseActionController.startAction(
        name: '_PaymentFilterStoreBase.setPaymentMethod');
    try {
      return super.setPaymentMethod(value);
    } finally {
      _$_PaymentFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaidValue(String value) {
    final _$actionInfo = _$_PaymentFilterStoreBaseActionController.startAction(
        name: '_PaymentFilterStoreBase.setPaidValue');
    try {
      return super.setPaidValue(value);
    } finally {
      _$_PaymentFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveFilters() {
    final _$actionInfo = _$_PaymentFilterStoreBaseActionController.startAction(
        name: '_PaymentFilterStoreBase.saveFilters');
    try {
      return super.saveFilters();
    } finally {
      _$_PaymentFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFilters() {
    final _$actionInfo = _$_PaymentFilterStoreBaseActionController.startAction(
        name: '_PaymentFilterStoreBase.resetFilters');
    try {
      return super.resetFilters();
    } finally {
      _$_PaymentFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetIdFilter() {
    final _$actionInfo = _$_PaymentFilterStoreBaseActionController.startAction(
        name: '_PaymentFilterStoreBase.resetIdFilter');
    try {
      return super.resetIdFilter();
    } finally {
      _$_PaymentFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCustomerFilter() {
    final _$actionInfo = _$_PaymentFilterStoreBaseActionController.startAction(
        name: '_PaymentFilterStoreBase.resetCustomerFilter');
    try {
      return super.resetCustomerFilter();
    } finally {
      _$_PaymentFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDateFilter() {
    final _$actionInfo = _$_PaymentFilterStoreBaseActionController.startAction(
        name: '_PaymentFilterStoreBase.resetDateFilter');
    try {
      return super.resetDateFilter();
    } finally {
      _$_PaymentFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPaymentMethodFilter() {
    final _$actionInfo = _$_PaymentFilterStoreBaseActionController.startAction(
        name: '_PaymentFilterStoreBase.resetPaymentMethodFilter');
    try {
      return super.resetPaymentMethodFilter();
    } finally {
      _$_PaymentFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPaidValueFilter() {
    final _$actionInfo = _$_PaymentFilterStoreBaseActionController.startAction(
        name: '_PaymentFilterStoreBase.resetPaidValueFilter');
    try {
      return super.resetPaidValueFilter();
    } finally {
      _$_PaymentFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFilterApplied: ${isFilterApplied},
id: ${id},
customer: ${customer},
dateRange: ${dateRange},
paymentMethod: ${paymentMethod},
paidValue: ${paidValue},
filters: ${filters}
    ''';
  }
}
