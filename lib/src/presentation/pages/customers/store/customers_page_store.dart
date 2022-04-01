import 'package:frproteses/src/domain/entities/bank_account_entity.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/presentation/pages/customers/store/customer_filter_store.dart';
import 'package:frproteses/src/presentation/stores/bank_account_store.dart';
import 'package:frproteses/src/presentation/stores/customer_store.dart';
import 'package:mobx/mobx.dart';
part 'customers_page_store.g.dart';

class CustomersPageStore = _CustomersPageStoreBase with _$CustomersPageStore;

abstract class _CustomersPageStoreBase with Store {
  final CustomerStore customerStore;
  final CustomerFilterStore filterStore;
  final BankAccountStore bankAccountStore;

  _CustomersPageStoreBase({
    required this.customerStore,
    required this.filterStore,
    required this.bankAccountStore,
  });

  final ObservableList<CustomerEntity> _data = ObservableList();
  final ObservableList<BankAccountEntity> _bankAccountData = ObservableList();

  @observable
  bool _loading = false;

  @observable
  int? _sortColumnIndex;

  @observable
  bool _sortAscending = false;

  @action
  void _startLoading() => _loading = true;

  @action
  void _stopLoading() => _loading = false;

  @action
  void setSortColumnIndex(int index, {bool isAscending = true}) {
    _sortColumnIndex = index;
    _sortAscending = isAscending;
  }

  @action
  Future<CustomerEntity?> createNew() async {
    _startLoading();
    final id = await customerStore.getNextId();
    _stopLoading();

    if (id == null) return null;

    return CustomerEntity.empty(id);
  }

  @action
  Future<List<CustomerEntity>?> loadAll() async {
    _startLoading();
    final list = await customerStore.getAll();

    if (list == null) {
      _stopLoading();
      return null;
    }

    _data.clear();
    _bankAccountData.clear();

    for (final customer in list) {
      final _bankAccount =
          await bankAccountStore.getByCustomerId(customer.id.toString());

      if (_bankAccount != null) {
        _bankAccountData.add(_bankAccount);
      }
    }

    _data.addAll(list.asObservable());

    _stopLoading();
    return list;
  }

  @action
  Future<void> updateBankAccount(CustomerEntity customerEntity) async {
    _startLoading();
    final _bankAccount =
        await bankAccountStore.getByCustomerId(customerEntity.id.toString());

    if (_bankAccount == null) {
      _stopLoading();
      return;
    }

    int index = -1;
    if ((index = _bankAccountData
            .indexWhere((e) => e.customerEntity.id == customerEntity.id)) !=
        -1) {
      _bankAccountData[index] = _bankAccount;
    }

    _stopLoading();
  }

  void _sortData(List<CustomerEntity> _myData) {
    if (_sortColumnIndex != null) {
      if (_sortColumnIndex == 0) {
        _myData.sort((a, b) {
          if (_sortAscending) {
            return a.id.compareTo(b.id);
          }

          return b.id.compareTo(a.id);
        });
      } else if (_sortColumnIndex == 1) {
        _myData.sort((a, b) {
          if (_sortAscending) {
            return a.fullName.compareTo(b.fullName);
          }

          return b.fullName.compareTo(a.fullName);
        });
      }
    }
  }

  @computed
  List<CustomerEntity> get _filteredData {
    List<CustomerEntity> newData = List<CustomerEntity>.empty(growable: true);
    newData.addAll(_data);

    if (filterStore.isFilterApplied) {
      newData = filterStore.applyFilters(newData);
    }

    _sortData(newData);

    return newData;
  }

  BankAccountEntity getBankAccount(CustomerEntity customerEntity) {
    return _bankAccountData.firstWhere(
        (e) => e.customerEntity.id == customerEntity.id,
        orElse: () => BankAccountEntity.empty(0, customerEntity));
  }

  @computed
  bool get isLoading => _loading || customerStore.isLoading;

  @computed
  bool get hasError => customerStore.hasError;

  @computed
  String get errorMessage => customerStore.errorMessage;

  @computed
  List<CustomerEntity> get data => _filteredData;

  @computed
  int? get sortColumnIndex => _sortColumnIndex;

  @computed
  bool get sortAscending => _sortAscending;
}
