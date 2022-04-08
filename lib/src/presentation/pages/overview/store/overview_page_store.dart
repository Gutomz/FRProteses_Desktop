import 'package:frproteses/src/domain/entities/bank_account_entity.dart';
import 'package:frproteses/src/presentation/stores/bank_account_store.dart';
import 'package:mobx/mobx.dart';
part 'overview_page_store.g.dart';

class OverviewPageStore = _OverviewPageStoreBase with _$OverviewPageStore;

abstract class _OverviewPageStoreBase with Store {
  final BankAccountStore bankAccountStore;

  final ObservableList<BankAccountEntity> _bankAccountsData = ObservableList();

  @observable
  BankAccountEntity? selectedBankAccount;

  @observable
  bool _loading = false;

  _OverviewPageStoreBase({required this.bankAccountStore}) {
    _setInitialValues();
  }

  @action
  Future<void> _setInitialValues() async {
    final _accountsList = await bankAccountStore.getAll();

    if (_accountsList != null) {
      _bankAccountsData.clear();
      _bankAccountsData.addAll(_accountsList.asObservable());
    }
  }

  @action
  void _startLoading() => _loading = true;

  @action
  void _stopLoading() => _loading = false;

  @action
  Future<void> updateBankAccount(int customerId) async {
    _startLoading();
    final _bankAccount =
        await bankAccountStore.getByCustomerId(customerId.toString());

    if (_bankAccount == null) {
      _stopLoading();
      return;
    }

    int index = -1;
    if ((index = _bankAccountsData
            .indexWhere((e) => e.customerEntity.id == customerId)) !=
        -1) {
      _bankAccountsData[index] = _bankAccount;
    }

    if (selectedBankAccount?.id == _bankAccount.id) {
      selectedBankAccount = null;
      selectedBankAccount = _bankAccount;
    }

    _stopLoading();
  }

  @action
  void setSelectedBankAccount(BankAccountEntity? _value) {
    if (_value == null) {
      selectedBankAccount = _value;
      return;
    }

    final _updatedIndex =
        _bankAccountsData.indexWhere((e) => e.id == _value.id);

    if (_updatedIndex == -1) {
      selectedBankAccount = _value;
      return;
    }

    selectedBankAccount = _bankAccountsData[_updatedIndex];
  }

  @computed
  List<BankAccountEntity> get bankAccounts => _bankAccountsData.toList();

  @computed
  int get ordersCount {
    if (selectedBankAccount != null) {
      final _selectedBankAccount = selectedBankAccount!;

      return _selectedBankAccount.ordersCount;
    }

    int _count = 0;
    for (final account in bankAccounts) {
      _count += account.ordersCount;
    }
    return _count;
  }

  @computed
  double get totalOrders {
    if (selectedBankAccount != null) {
      final _selectedBankAccount = selectedBankAccount!;

      return _selectedBankAccount.ordersTotalValue;
    }

    double _count = 0;
    for (final account in bankAccounts) {
      _count += account.ordersTotalValue;
    }

    return _count;
  }

  @computed
  int get paymentsCount {
    if (selectedBankAccount != null) {
      final _selectedBankAccount = selectedBankAccount!;

      return _selectedBankAccount.paymentsCount;
    }

    int _count = 0;
    for (final account in bankAccounts) {
      _count += account.paymentsCount;
    }
    return _count;
  }

  @computed
  double get totalPayments {
    if (selectedBankAccount != null) {
      final _selectedBankAccount = selectedBankAccount!;

      return _selectedBankAccount.paymentsTotalValue;
    }

    double _count = 0;
    for (final account in bankAccounts) {
      _count += account.paymentsTotalValue;
    }

    return _count;
  }

  @computed
  double get balance {
    if (selectedBankAccount != null) {
      final _selectedBankAccount = selectedBankAccount!;

      return _selectedBankAccount.balance;
    }

    double _count = 0;
    for (final account in bankAccounts) {
      _count += account.balance;
    }

    return _count;
  }

  @computed
  bool get isOutstanding =>
      selectedBankAccount != null &&
      selectedBankAccount!.outstandingBalance > 0;

  @computed
  bool get isLoading => _loading || bankAccountStore.isLoading;

  @computed
  bool get hasError => bankAccountStore.hasError;

  @computed
  String get errorMessage => bankAccountStore.errorMessage;
}
