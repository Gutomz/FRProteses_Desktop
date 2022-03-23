import 'package:frproteses/src/core/enums/order_status_type.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/presentation/widgets/show_filters_widget.dart';
import 'package:mobx/mobx.dart';
part 'order_filter_store.g.dart';

class OrderFilterStore = _OrderFilterStoreBase with _$OrderFilterStore;

abstract class _OrderFilterStoreBase with Store {
  @observable
  String _id = "";

  @observable
  OrderStatusType? _status;

  @observable
  String _customer = "";

  @observable
  String _orderDateRange = "";

  @observable
  String _deliveryDateRange = "";

  @observable
  String _totalPriceValue = "";

  @observable
  String _idFilter = "";

  @observable
  OrderStatusType? _statusFilter;

  @observable
  String _customerFilter = "";

  @observable
  String _orderDateRangeFilter = "";

  @observable
  String _deliveryDateRangeFilter = "";

  @observable
  String _totalPriceValueFilter = "";

  @observable
  bool isFilterApplied = false;

  @action
  void setId(String value) => _id = value;

  @action
  void setStatus(OrderStatusType? value) => _status = value;

  @action
  void setCustomer(String value) => _customer = value;

  @action
  void setOrderDateRange(String value) => _orderDateRange = value;

  @action
  void setDeliveryDateRange(String value) => _deliveryDateRange = value;

  @action
  void setTotalPriceValue(String value) => _totalPriceValue = value;

  @action
  void saveFilters() {
    _idFilter = _id;
    _statusFilter = _status;
    _customerFilter = _customer;
    _orderDateRangeFilter = _orderDateRange;
    _orderDateRangeFilter = _orderDateRange;
    _deliveryDateRangeFilter = _deliveryDateRange;
    _totalPriceValueFilter = _totalPriceValue;
    isFilterApplied = true;
  }

  @action
  void resetFilters() {
    resetIdFilter();
    resetStatusFilter();
    resetCustomerFilter();
    resetOrderDateRangeFilter();
    resetDeliveryDateRangeFilter();
    resetTotalPriceValueFilter();
    isFilterApplied = false;
  }

  @action
  void resetIdFilter() {
    _id = "";
    _idFilter = "";
  }

  @action
  void resetStatusFilter() {
    _status = null;
    _statusFilter = null;
  }

  @action
  void resetCustomerFilter() {
    _customer = "";
    _customerFilter = "";
  }

  @action
  void resetOrderDateRangeFilter() {
    _orderDateRange = "";
    _orderDateRangeFilter = "";
  }

  @action
  void resetDeliveryDateRangeFilter() {
    _deliveryDateRange = "";
    _deliveryDateRangeFilter = "";
  }

  @action
  void resetTotalPriceValueFilter() {
    _totalPriceValue = "";
    _totalPriceValueFilter = "";
  }

  bool _filterById(int id) {
    return _idFilter.isEmpty ||
        (_idFilter.isNotEmpty &&
            id.toString().padLeft(4, "0").contains(_idFilter));
  }

  bool _filterByStatus(OrderStatusType statusType) {
    return _statusFilter == null ||
        (_statusFilter != null && statusType.isEqual(_statusFilter!));
  }

  bool _filterByCustomer(String name) {
    return _customerFilter.isEmpty ||
        (_customerFilter.isNotEmpty &&
            name.toLowerCase().contains(_customerFilter.toLowerCase()));
  }

  bool _filterByOrderDateRange(String dateStr) {
    final dateTime = dateStr.toDateTime()!;
    final range = _orderDateRangeFilter.toDateTimeRange();

    return range == null ||
        range.start.compareTo(dateTime) == 0 ||
        range.end.compareTo(dateTime) == 0 ||
        (range.start.isBefore(dateTime) && range.end.isAfter(dateTime));
  }

  bool _filterByDeliveryDateRange(String dateStr) {
    final dateTime = dateStr.toDateTime();
    final range = _orderDateRangeFilter.toDateTimeRange();

    return range == null ||
        (dateTime != null &&
            (range.start.compareTo(dateTime) == 0 ||
                range.end.compareTo(dateTime) == 0 ||
                (range.start.isBefore(dateTime) &&
                    range.end.isAfter(dateTime))));
  }

  bool _filterByTotalPriceValue(double price) {
    final filterNum = num.tryParse(_totalPriceValueFilter)?.toDouble() ?? 0;
    return filterNum == 0 || (filterNum > 0 && price == filterNum);
  }

  List<OrderEntity> applyFilters(List<OrderEntity> _list) {
    List<OrderEntity> newList = _list.where((e) => _filterById(e.id)).toList();
    newList = newList.where((e) => _filterByStatus(e.statusType)).toList();
    newList = newList
        .where((e) => _filterByCustomer(e.customerEntity.fullName))
        .toList();
    newList =
        newList.where((e) => _filterByOrderDateRange(e.orderDate)).toList();
    newList = newList
        .where((e) => _filterByDeliveryDateRange(e.deliveryDate))
        .toList();
    newList =
        newList.where((e) => _filterByTotalPriceValue(e.totalPrice)).toList();

    return newList;
  }

  @computed
  String get id => _idFilter;

  @computed
  OrderStatusType? get status => _statusFilter;

  @computed
  String get customer => _customerFilter;

  @computed
  String get orderDateRange => _orderDateRangeFilter;

  @computed
  String get deliveryDateRange => _deliveryDateRangeFilter;

  @computed
  String get totalPriceValue => _totalPriceValueFilter;

  @computed
  List<Filter> get filters {
    final output = List<Filter>.empty(growable: true);

    if (id.isNotEmpty) {
      output.add(Filter(name: "ID", value: id, onDeleted: resetIdFilter));
    }

    if (status != null) {
      output.add(Filter(
        name: "Status",
        value: status!.title,
        onDeleted: resetStatusFilter,
      ));
    }

    final numPrice = num.tryParse(totalPriceValue)?.toDouble() ?? 0;
    if (totalPriceValue.isNotEmpty && numPrice > 0) {
      output.add(Filter(
        name: "Preço Total",
        value: numPrice.formatMoney(),
        onDeleted: resetTotalPriceValueFilter,
      ));
    }

    if (customer.isNotEmpty) {
      output.add(Filter(
        name: "Cliente",
        value: customer,
        onDeleted: resetCustomerFilter,
      ));
    }

    final _odRange = orderDateRange.toDateTimeRange();
    if (orderDateRange.isNotEmpty && _odRange != null) {
      output.add(Filter(
        name: "Pedido",
        value: "${_odRange.start.formatDate()} - ${_odRange.end.formatDate()}",
        onDeleted: resetOrderDateRangeFilter,
      ));
    }

    final _ddRange = deliveryDateRange.toDateTimeRange();
    if (deliveryDateRange.isNotEmpty && _ddRange != null) {
      output.add(Filter(
        name: "Entrega",
        value: "${_ddRange.start.formatDate()} - ${_ddRange.end.formatDate()}",
        onDeleted: resetOrderDateRangeFilter,
      ));
    }

    return output;
  }
}
