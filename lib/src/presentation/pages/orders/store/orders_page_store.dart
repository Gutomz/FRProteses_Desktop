import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/presentation/pages/orders/store/order_filter_store.dart';
import 'package:frproteses/src/presentation/stores/order_store.dart';
import 'package:mobx/mobx.dart';
part 'orders_page_store.g.dart';

class OrdersPageStore = _OrdersPageStoreBase with _$OrdersPageStore;

abstract class _OrdersPageStoreBase with Store {
  final OrderStore orderStore;
  final OrderFilterStore filterStore;

  _OrdersPageStoreBase({
    required this.orderStore,
    required this.filterStore,
  });

  final ObservableList<OrderEntity> _data = ObservableList();

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
  Future<OrderEntity?> createNew() async {
    _startLoading();
    final id = await orderStore.getNextId();
    _stopLoading();

    if (id == null) return null;

    return OrderEntity.empty(id);
  }

  @action
  Future<List<OrderEntity>?> loadAll() async {
    _startLoading();
    final list = await orderStore.getAll();
    _stopLoading();

    if (list == null) return null;

    _data.clear();
    _data.addAll(list.asObservable());

    return list;
  }

  void _sortData(List<OrderEntity> _myData) {
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
            return a.statusType.index.compareTo(b.statusType.index);
          }

          return b.statusType.index.compareTo(a.statusType.index);
        });
      } else if (_sortColumnIndex == 2) {
        _myData.sort((a, b) {
          if (_sortAscending) {
            return a.customerEntity.fullName
                .compareTo(b.customerEntity.fullName);
          }

          return b.customerEntity.fullName.compareTo(a.customerEntity.fullName);
        });
      } else if (_sortColumnIndex == 3) {
        _myData.sort((a, b) {
          if (_sortAscending) {
            return a.totalPrice.compareTo(b.totalPrice);
          }

          return b.totalPrice.compareTo(a.totalPrice);
        });
      } else if (_sortColumnIndex == 4) {
        _myData.sort((a, b) {
          final aDate = a.orderDate.toDateTime()!;
          final bDate = b.orderDate.toDateTime()!;

          if (_sortAscending) {
            return aDate.compareTo(bDate);
          }

          return bDate.compareTo(aDate);
        });
      } else if (_sortColumnIndex == 5) {
        _myData.sort((a, b) {
          final aDate = a.orderDate.toDateTime();
          final bDate = b.orderDate.toDateTime();

          if (_sortAscending) {
            if (aDate == null) return -1;
            if (bDate == null) return 1;
            return aDate.compareTo(bDate);
          }

          if (aDate == null) return 1;
          if (bDate == null) return -1;
          return bDate.compareTo(aDate);
        });
      }
    }
  }

  @computed
  List<OrderEntity> get _filteredData {
    List<OrderEntity> newData = List<OrderEntity>.empty(growable: true);
    newData.addAll(_data);

    if (filterStore.isFilterApplied) {
      newData = filterStore.applyFilters(newData);
    }

    _sortData(newData);

    return newData;
  }

  @computed
  bool get isLoading => _loading || orderStore.isLoading;

  @computed
  bool get hasError => orderStore.hasError;

  @computed
  String get errorMessage => orderStore.errorMessage;

  @computed
  List<OrderEntity> get data => _filteredData;

  @computed
  int? get sortColumnIndex => _sortColumnIndex;

  @computed
  bool get sortAscending => _sortAscending;
}
