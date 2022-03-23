import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';
import 'package:frproteses/src/presentation/widgets/show_filters_widget.dart';
import 'package:mobx/mobx.dart';
part 'payment_filter_store.g.dart';

class PaymentFilterStore = _PaymentFilterStoreBase with _$PaymentFilterStore;

abstract class _PaymentFilterStoreBase with Store {
  @observable
  String _id = "";

  @observable
  String _customer = "";

  @observable
  String _dateRange = "";

  @observable
  PaymentMethodType? _paymentMethod;

  @observable
  String _paidValue = "";

  @observable
  String _idFilter = "";

  @observable
  String _customerFilter = "";

  @observable
  String _dateRangeFilter = "";

  @observable
  PaymentMethodType? _paymentMethodFilter;

  @observable
  String _paidValueFilter = "";

  @observable
  bool isFilterApplied = false;

  @action
  void setId(String value) => _id = value;

  @action
  void setCustomer(String value) => _customer = value;

  @action
  void setDateRange(String value) => _dateRange = value;

  @action
  void setPaymentMethod(PaymentMethodType? value) => _paymentMethod = value;

  @action
  void setPaidValue(String value) => _paidValue = value;

  @action
  void saveFilters() {
    _idFilter = _id;
    _customerFilter = _customer;
    _dateRangeFilter = _dateRange;
    _paymentMethodFilter = _paymentMethod;
    _paidValueFilter = _paidValue;
    isFilterApplied = true;
  }

  @action
  void resetFilters() {
    resetIdFilter();
    resetCustomerFilter();
    resetDateFilter();
    resetPaymentMethodFilter();
    resetPaidValueFilter();
    isFilterApplied = false;
  }

  @action
  void resetIdFilter() {
    _id = "";
    _idFilter = "";
  }

  @action
  void resetCustomerFilter() {
    _customer = "";
    _customerFilter = "";
  }

  @action
  void resetDateFilter() {
    _dateRange = "";
    _dateRangeFilter = "";
  }

  @action
  void resetPaymentMethodFilter() {
    _paymentMethod = null;
    _paymentMethodFilter = null;
  }

  @action
  void resetPaidValueFilter() {
    _paidValue = "";
    _paidValueFilter = "";
  }

  bool _filterById(int id) {
    return _idFilter.isEmpty ||
        (_idFilter.isNotEmpty &&
            id.toString().padLeft(4, "0").contains(_idFilter));
  }

  bool _filterByCustomer(String name) {
    return _customerFilter.isEmpty ||
        (_customerFilter.isNotEmpty &&
            name.toLowerCase().contains(_customerFilter.toLowerCase()));
  }

  bool _filterByDate(String dateStr) {
    final dateTime = dateStr.toDateTime()!;
    final range = dateRange.toDateTimeRange();

    return range == null ||
        range.start.compareTo(dateTime) == 0 ||
        range.end.compareTo(dateTime) == 0 ||
        (range.start.isBefore(dateTime) && range.end.isAfter(dateTime));
  }

  bool _filterByPaymentMethod(PaymentMethodType type) {
    return _paymentMethodFilter == null || type.isEqual(_paymentMethodFilter!);
  }

  bool _filterByPaidValue(double price) {
    final filterNum = num.tryParse(_paidValueFilter)?.toDouble() ?? 0;
    return filterNum == 0 || (filterNum > 0 && price == filterNum);
  }

  List<PaymentEntity> applyFilters(List<PaymentEntity> _list) {
    final newList = List<PaymentEntity>.empty(growable: true);

    final filteredById = _list.where((e) => _filterById(e.id)).toList();
    final filteredByCustomer = filteredById
        .where((e) => _filterByCustomer(e.customerEntity.fullName))
        .toList();
    final filteredByDate =
        filteredByCustomer.where((e) => _filterByDate(e.date)).toList();
    final filteredByPaymentMethod = filteredByDate
        .where((e) => _filterByPaymentMethod(e.methodEntity.type))
        .toList();
    final filteredByPaidValue = filteredByPaymentMethod
        .where((e) => _filterByPaidValue(e.value))
        .toList();

    newList.addAll(filteredByPaidValue);
    return newList;
  }

  @computed
  String get id => _idFilter;

  @computed
  String get customer => _customerFilter;

  @computed
  String get dateRange => _dateRangeFilter;

  @computed
  PaymentMethodType? get paymentMethod => _paymentMethodFilter;

  @computed
  String get paidValue => _paidValueFilter;

  @computed
  List<Filter> get filters {
    final output = List<Filter>.empty(growable: true);

    if (id.isNotEmpty) {
      output.add(Filter(name: "ID", value: id, onDeleted: resetIdFilter));
    }

    if (customer.isNotEmpty) {
      output.add(Filter(
        name: "Cliente",
        value: customer,
        onDeleted: resetCustomerFilter,
      ));
    }

    final range = dateRange.toDateTimeRange();
    if (dateRange.isNotEmpty && range != null) {
      output.add(Filter(
        name: "Data",
        value: "${range.start.formatDate()} - ${range.end.formatDate()}",
        onDeleted: resetDateFilter,
      ));
    }

    if (paymentMethod != null) {
      output.add(Filter(
        name: "Método de Pagamento",
        value: paymentMethod!.title,
        onDeleted: resetPaymentMethodFilter,
      ));
    }

    final numPrice = num.tryParse(paidValue)?.toDouble() ?? 0;
    if (paidValue.isNotEmpty && numPrice > 0) {
      output.add(Filter(
        name: "Valor Pago",
        value: numPrice.formatMoney(),
        onDeleted: resetPaidValueFilter,
      ));
    }

    return output;
  }
}
