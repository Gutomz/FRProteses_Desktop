import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/presentation/pages/products/store/product_filter_store.dart';
import 'package:frproteses/src/presentation/stores/product_store.dart';
import 'package:mobx/mobx.dart';
part 'products_page_store.g.dart';

class ProductsPageStore = _ProductsPageStoreBase with _$ProductsPageStore;

abstract class _ProductsPageStoreBase with Store {
  final ProductStore productStore;
  final ProductFilterStore filterStore;

  _ProductsPageStoreBase({
    required this.productStore,
    required this.filterStore,
  });

  final ObservableList<ProductEntity> _data = ObservableList();

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
  Future<ProductEntity?> createNew() async {
    _startLoading();
    final id = await productStore.getNextId();
    _stopLoading();

    if (id == null) return null;

    return ProductEntity.empty(id);
  }

  @action
  Future<List<ProductEntity>?> loadAll() async {
    _startLoading();
    final list = await productStore.getAll();
    _stopLoading();

    if (list == null) return null;

    _data.clear();
    _data.addAll(list.asObservable());

    return list;
  }

  void _sortData(List<ProductEntity> _myData) {
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
            return a.name.compareTo(b.name);
          }

          return b.name.compareTo(a.name);
        });
      } else if (_sortColumnIndex == 2) {
        _myData.sort((a, b) {
          if (_sortAscending) {
            return a.price.compareTo(b.price);
          }

          return b.price.compareTo(a.price);
        });
      }
    }
  }

  @computed
  List<ProductEntity> get _filteredData {
    List<ProductEntity> newData = List<ProductEntity>.empty(growable: true);
    newData.addAll(_data);

    if (filterStore.isFilterApplied) {
      newData = filterStore.applyFilters(newData);
    }

    _sortData(newData);

    return newData;
  }

  @computed
  bool get isLoading => _loading || productStore.isLoading;

  @computed
  bool get hasError => productStore.hasError;

  @computed
  String get errorMessage => productStore.errorMessage;

  @computed
  List<ProductEntity> get data => _filteredData;

  @computed
  int? get sortColumnIndex => _sortColumnIndex;

  @computed
  bool get sortAscending => _sortAscending;
}
