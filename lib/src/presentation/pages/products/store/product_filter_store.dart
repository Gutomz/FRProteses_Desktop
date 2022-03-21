import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/presentation/widgets/show_filters_widget.dart';
import 'package:mobx/mobx.dart';
part 'product_filter_store.g.dart';

class ProductFilterStore = _ProductFilterStoreBase with _$ProductFilterStore;

abstract class _ProductFilterStoreBase with Store {
  @observable
  String _id = "";

  @observable
  String _name = "";

  @observable
  String _price = "";

  @observable
  String _idFilter = "";

  @observable
  String _nameFilter = "";

  @observable
  String _priceFilter = "";

  @observable
  bool isFilterApplied = false;

  @action
  void setId(String value) => _id = value;

  @action
  void setName(String value) => _name = value;

  @action
  void setPrice(String value) => _price = value;

  @action
  void saveFilters() {
    _idFilter = _id;
    _nameFilter = _name;
    _priceFilter = _price;
    isFilterApplied = true;
  }

  @action
  void resetFilters() {
    resetIdFilter();
    resetNameFilter();
    resetPriceFilter();
    isFilterApplied = false;
  }

  @action
  void resetIdFilter() {
    _id = "";
    _idFilter = "";
  }

  @action
  void resetNameFilter() {
    _name = "";
    _nameFilter = "";
  }

  @action
  void resetPriceFilter() {
    _price = "";
    _priceFilter = "";
  }

  bool _filterById(int id) {
    return _idFilter.isEmpty ||
        (_idFilter.isNotEmpty &&
            id.toString().padLeft(4, "0").contains(_idFilter));
  }

  bool _filterByName(String name) {
    return _nameFilter.isEmpty ||
        (_nameFilter.isNotEmpty &&
            name.toLowerCase().contains(_nameFilter.toLowerCase()));
  }

  bool _filterByPrice(double price) {
    final filterNum = num.tryParse(_priceFilter)?.toDouble() ?? 0;

    return filterNum == 0 || (filterNum > 0 && price == filterNum);
  }

  List<ProductEntity> applyFilters(List<ProductEntity> _list) {
    final newList = List<ProductEntity>.empty(growable: true);

    final filteredById = _list.where((e) => _filterById(e.id)).toList();
    final filteredByName =
        filteredById.where((e) => _filterByName(e.name)).toList();
    final filteredByPrice =
        filteredByName.where((e) => _filterByPrice(e.price)).toList();

    newList.addAll(filteredByPrice);
    return newList;
  }

  @computed
  String get id => _idFilter;

  @computed
  String get name => _nameFilter;

  @computed
  String get price => _priceFilter;

  @computed
  List<Filter> get filters {
    final output = List<Filter>.empty(growable: true);

    if (id.isNotEmpty) {
      output.add(Filter(name: "ID", value: id, onDeleted: resetIdFilter));
    }

    if (name.isNotEmpty) {
      output.add(Filter(name: "Nome", value: name, onDeleted: resetNameFilter));
    }

    final numPrice = num.tryParse(price)?.toDouble() ?? 0;
    if (price.isNotEmpty && numPrice > 0) {
      output.add(Filter(
        name: "Preço",
        value: numPrice.formatMoney(),
        onDeleted: resetPriceFilter,
      ));
    }

    return output;
  }
}
