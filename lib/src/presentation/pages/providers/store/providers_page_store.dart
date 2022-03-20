import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/presentation/pages/providers/store/provider_filter_store.dart';
import 'package:frproteses/src/presentation/stores/provider_store.dart';
import 'package:mobx/mobx.dart';
part 'providers_page_store.g.dart';

class ProvidersPageStore = _ProvidersPageStoreBase with _$ProvidersPageStore;

abstract class _ProvidersPageStoreBase with Store {
  final ProviderStore providerStore;
  final ProviderFilterStore filterStore;

  _ProvidersPageStoreBase({
    required this.providerStore,
    required this.filterStore,
  });

  final ObservableList<ProviderEntity> _data = ObservableList();

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
  Future<ProviderEntity?> createNew() async {
    _startLoading();
    final id = await providerStore.getNextId();
    _stopLoading();

    if (id == null) return null;

    return ProviderEntity.empty(id);
  }

  @action
  Future<List<ProviderEntity>?> loadAll() async {
    _startLoading();
    final list = await providerStore.getAll();
    _stopLoading();

    if (list == null) return null;

    _data.clear();
    _data.addAll(list.asObservable());

    return list;
  }

  void _sortData(List<ProviderEntity> _myData) {
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
  List<ProviderEntity> get _filteredData {
    List<ProviderEntity> newData = List<ProviderEntity>.empty(growable: true);
    newData.addAll(_data);

    if (filterStore.isFilterApplied) {
      newData = filterStore.applyFilters(newData);
    }

    _sortData(newData);

    return newData;
  }

  @computed
  bool get isLoading => _loading || providerStore.isLoading;

  @computed
  bool get hasError => providerStore.hasError;

  @computed
  String get errorMessage => providerStore.errorMessage;

  @computed
  List<ProviderEntity> get data => _filteredData;

  @computed
  int? get sortColumnIndex => _sortColumnIndex;

  @computed
  bool get sortAscending => _sortAscending;
}
