import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';
import 'package:frproteses/src/presentation/pages/payments/store/payment_filter_store.dart';
import 'package:frproteses/src/presentation/stores/payment_store.dart';
import 'package:mobx/mobx.dart';

part 'payments_page_store.g.dart';

class PaymentsPageStore = _PaymentsPageStoreBase with _$PaymentsPageStore;

abstract class _PaymentsPageStoreBase with Store {
  final PaymentStore paymentStore;
  final PaymentFilterStore filterStore;

  _PaymentsPageStoreBase({
    required this.paymentStore,
    required this.filterStore,
  });

  final ObservableList<PaymentEntity> _data = ObservableList();

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
  Future<PaymentEntity?> createNew() async {
    _startLoading();
    final id = await paymentStore.getNextId();
    _stopLoading();

    if (id == null) return null;

    return PaymentEntity.empty(id);
  }

  @action
  Future<List<PaymentEntity>?> loadAll() async {
    _startLoading();
    final list = await paymentStore.getAll();
    _stopLoading();

    if (list == null) return null;

    _data.clear();
    _data.addAll(list.asObservable());

    return list;
  }

  void _sortData(List<PaymentEntity> _myData) {
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
            return a.customerEntity.fullName
                .compareTo(b.customerEntity.fullName);
          }

          return b.customerEntity.fullName.compareTo(a.customerEntity.fullName);
        });
      } else if (_sortColumnIndex == 2) {
        _myData.sort((a, b) {
          if (_sortAscending) {
            return a.value.compareTo(b.value);
          }

          return b.value.compareTo(a.value);
        });
      } else if (_sortColumnIndex == 3) {
        _myData.sort((a, b) {
          if (_sortAscending) {
            return a.methodEntity.type.index
                .compareTo(b.methodEntity.type.index);
          }

          return b.methodEntity.type.index.compareTo(a.methodEntity.type.index);
        });
      } else if (_sortColumnIndex == 4) {
        _myData.sort((a, b) {
          final aDate = a.date.toDateTime()!;
          final bDate = b.date.toDateTime()!;

          if (_sortAscending) {
            return aDate.compareTo(bDate);
          }

          return bDate.compareTo(aDate);
        });
      }
    }
  }

  @computed
  List<PaymentEntity> get _filteredData {
    List<PaymentEntity> newData = List<PaymentEntity>.empty(growable: true);
    newData.addAll(_data);

    if (filterStore.isFilterApplied) {
      newData = filterStore.applyFilters(newData);
    }

    _sortData(newData);

    return newData;
  }

  @computed
  bool get isLoading => _loading || paymentStore.isLoading;

  @computed
  bool get hasError => paymentStore.hasError;

  @computed
  String get errorMessage => paymentStore.errorMessage;

  @computed
  List<PaymentEntity> get data => _filteredData;

  @computed
  int? get sortColumnIndex => _sortColumnIndex;

  @computed
  bool get sortAscending => _sortAscending;
}
