// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderFilterStore on _OrderFilterStoreBase, Store {
  Computed<String>? _$idComputed;

  @override
  String get id => (_$idComputed ??=
          Computed<String>(() => super.id, name: '_OrderFilterStoreBase.id'))
      .value;
  Computed<OrderStatusType?>? _$statusComputed;

  @override
  OrderStatusType? get status =>
      (_$statusComputed ??= Computed<OrderStatusType?>(() => super.status,
              name: '_OrderFilterStoreBase.status'))
          .value;
  Computed<String>? _$customerComputed;

  @override
  String get customer =>
      (_$customerComputed ??= Computed<String>(() => super.customer,
              name: '_OrderFilterStoreBase.customer'))
          .value;
  Computed<String>? _$orderDateRangeComputed;

  @override
  String get orderDateRange =>
      (_$orderDateRangeComputed ??= Computed<String>(() => super.orderDateRange,
              name: '_OrderFilterStoreBase.orderDateRange'))
          .value;
  Computed<String>? _$deliveryDateRangeComputed;

  @override
  String get deliveryDateRange => (_$deliveryDateRangeComputed ??=
          Computed<String>(() => super.deliveryDateRange,
              name: '_OrderFilterStoreBase.deliveryDateRange'))
      .value;
  Computed<String>? _$totalPriceValueComputed;

  @override
  String get totalPriceValue => (_$totalPriceValueComputed ??= Computed<String>(
          () => super.totalPriceValue,
          name: '_OrderFilterStoreBase.totalPriceValue'))
      .value;
  Computed<List<Filter>>? _$filtersComputed;

  @override
  List<Filter> get filters =>
      (_$filtersComputed ??= Computed<List<Filter>>(() => super.filters,
              name: '_OrderFilterStoreBase.filters'))
          .value;

  final _$_idAtom = Atom(name: '_OrderFilterStoreBase._id');

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

  final _$_statusAtom = Atom(name: '_OrderFilterStoreBase._status');

  @override
  OrderStatusType? get _status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  set _status(OrderStatusType? value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  final _$_customerAtom = Atom(name: '_OrderFilterStoreBase._customer');

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

  final _$_orderDateRangeAtom =
      Atom(name: '_OrderFilterStoreBase._orderDateRange');

  @override
  String get _orderDateRange {
    _$_orderDateRangeAtom.reportRead();
    return super._orderDateRange;
  }

  @override
  set _orderDateRange(String value) {
    _$_orderDateRangeAtom.reportWrite(value, super._orderDateRange, () {
      super._orderDateRange = value;
    });
  }

  final _$_deliveryDateRangeAtom =
      Atom(name: '_OrderFilterStoreBase._deliveryDateRange');

  @override
  String get _deliveryDateRange {
    _$_deliveryDateRangeAtom.reportRead();
    return super._deliveryDateRange;
  }

  @override
  set _deliveryDateRange(String value) {
    _$_deliveryDateRangeAtom.reportWrite(value, super._deliveryDateRange, () {
      super._deliveryDateRange = value;
    });
  }

  final _$_totalPriceValueAtom =
      Atom(name: '_OrderFilterStoreBase._totalPriceValue');

  @override
  String get _totalPriceValue {
    _$_totalPriceValueAtom.reportRead();
    return super._totalPriceValue;
  }

  @override
  set _totalPriceValue(String value) {
    _$_totalPriceValueAtom.reportWrite(value, super._totalPriceValue, () {
      super._totalPriceValue = value;
    });
  }

  final _$_idFilterAtom = Atom(name: '_OrderFilterStoreBase._idFilter');

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

  final _$_statusFilterAtom = Atom(name: '_OrderFilterStoreBase._statusFilter');

  @override
  OrderStatusType? get _statusFilter {
    _$_statusFilterAtom.reportRead();
    return super._statusFilter;
  }

  @override
  set _statusFilter(OrderStatusType? value) {
    _$_statusFilterAtom.reportWrite(value, super._statusFilter, () {
      super._statusFilter = value;
    });
  }

  final _$_customerFilterAtom =
      Atom(name: '_OrderFilterStoreBase._customerFilter');

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

  final _$_orderDateRangeFilterAtom =
      Atom(name: '_OrderFilterStoreBase._orderDateRangeFilter');

  @override
  String get _orderDateRangeFilter {
    _$_orderDateRangeFilterAtom.reportRead();
    return super._orderDateRangeFilter;
  }

  @override
  set _orderDateRangeFilter(String value) {
    _$_orderDateRangeFilterAtom.reportWrite(value, super._orderDateRangeFilter,
        () {
      super._orderDateRangeFilter = value;
    });
  }

  final _$_deliveryDateRangeFilterAtom =
      Atom(name: '_OrderFilterStoreBase._deliveryDateRangeFilter');

  @override
  String get _deliveryDateRangeFilter {
    _$_deliveryDateRangeFilterAtom.reportRead();
    return super._deliveryDateRangeFilter;
  }

  @override
  set _deliveryDateRangeFilter(String value) {
    _$_deliveryDateRangeFilterAtom
        .reportWrite(value, super._deliveryDateRangeFilter, () {
      super._deliveryDateRangeFilter = value;
    });
  }

  final _$_totalPriceValueFilterAtom =
      Atom(name: '_OrderFilterStoreBase._totalPriceValueFilter');

  @override
  String get _totalPriceValueFilter {
    _$_totalPriceValueFilterAtom.reportRead();
    return super._totalPriceValueFilter;
  }

  @override
  set _totalPriceValueFilter(String value) {
    _$_totalPriceValueFilterAtom
        .reportWrite(value, super._totalPriceValueFilter, () {
      super._totalPriceValueFilter = value;
    });
  }

  final _$isFilterAppliedAtom =
      Atom(name: '_OrderFilterStoreBase.isFilterApplied');

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

  final _$_OrderFilterStoreBaseActionController =
      ActionController(name: '_OrderFilterStoreBase');

  @override
  void setId(String value) {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(OrderStatusType? value) {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCustomer(String value) {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.setCustomer');
    try {
      return super.setCustomer(value);
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderDateRange(String value) {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.setOrderDateRange');
    try {
      return super.setOrderDateRange(value);
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDeliveryDateRange(String value) {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.setDeliveryDateRange');
    try {
      return super.setDeliveryDateRange(value);
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalPriceValue(String value) {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.setTotalPriceValue');
    try {
      return super.setTotalPriceValue(value);
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveFilters() {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.saveFilters');
    try {
      return super.saveFilters();
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFilters() {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.resetFilters');
    try {
      return super.resetFilters();
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetIdFilter() {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.resetIdFilter');
    try {
      return super.resetIdFilter();
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetStatusFilter() {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.resetStatusFilter');
    try {
      return super.resetStatusFilter();
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCustomerFilter() {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.resetCustomerFilter');
    try {
      return super.resetCustomerFilter();
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetOrderDateRangeFilter() {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.resetOrderDateRangeFilter');
    try {
      return super.resetOrderDateRangeFilter();
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDeliveryDateRangeFilter() {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.resetDeliveryDateRangeFilter');
    try {
      return super.resetDeliveryDateRangeFilter();
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetTotalPriceValueFilter() {
    final _$actionInfo = _$_OrderFilterStoreBaseActionController.startAction(
        name: '_OrderFilterStoreBase.resetTotalPriceValueFilter');
    try {
      return super.resetTotalPriceValueFilter();
    } finally {
      _$_OrderFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFilterApplied: ${isFilterApplied},
id: ${id},
status: ${status},
customer: ${customer},
orderDateRange: ${orderDateRange},
deliveryDateRange: ${deliveryDateRange},
totalPriceValue: ${totalPriceValue},
filters: ${filters}
    ''';
  }
}
