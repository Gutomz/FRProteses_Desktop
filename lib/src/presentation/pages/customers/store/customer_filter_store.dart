import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/presentation/widgets/show_filters_widget.dart';
import 'package:mobx/mobx.dart';
part 'customer_filter_store.g.dart';

class CustomerFilterStore = _CustomerFilterStoreBase with _$CustomerFilterStore;

abstract class _CustomerFilterStoreBase with Store {
  @observable
  String _id = "";

  @observable
  String _fullName = "";

  @observable
  String _idFilter = "";

  @observable
  String _fullNameFilter = "";

  @observable
  bool isFilterApplied = false;

  @action
  void setId(String value) => _id = value;

  @action
  void setFullName(String value) => _fullName = value;

  @action
  void saveFilters() {
    _idFilter = _id;
    _fullNameFilter = _fullName;
    isFilterApplied = true;
  }

  @action
  void resetFilters() {
    resetIdFilter();
    resetFullNameFilter();
    isFilterApplied = false;
  }

  @action
  void resetIdFilter() {
    _id = "";
    _idFilter = "";
  }

  @action
  void resetFullNameFilter() {
    _fullName = "";
    _fullNameFilter = "";
  }

  bool _filterById(int id) {
    return _idFilter.isEmpty ||
        (_idFilter.isNotEmpty &&
            id.toString().padLeft(4, "0").contains(_idFilter));
  }

  bool _filterByName(String name) {
    return _fullNameFilter.isEmpty ||
        (_fullNameFilter.isNotEmpty &&
            name.toLowerCase().contains(_fullNameFilter.toLowerCase()));
  }

  List<CustomerEntity> applyFilters(List<CustomerEntity> _list) {
    final newList = List<CustomerEntity>.empty(growable: true);

    final filteredById = _list.where((e) => _filterById(e.id)).toList();
    final filteredByName =
        filteredById.where((e) => _filterByName(e.fullName)).toList();

    newList.addAll(filteredByName);
    return newList;
  }

  @computed
  String get id => _idFilter;

  @computed
  String get fullName => _fullNameFilter;

  @computed
  List<Filter> get filters {
    final output = List<Filter>.empty(growable: true);

    if (id.isNotEmpty) {
      output.add(Filter(name: "ID", value: id, onDeleted: resetIdFilter));
    }

    if (fullName.isNotEmpty) {
      output.add(Filter(
          name: "Nome", value: fullName, onDeleted: resetFullNameFilter));
    }

    return output;
  }
}
