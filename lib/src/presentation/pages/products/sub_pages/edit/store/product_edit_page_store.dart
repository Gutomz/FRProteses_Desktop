import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/stores/product_store.dart';
import 'package:mobx/mobx.dart';
part 'product_edit_page_store.g.dart';

class ProductEditPageStore = _ProductEditPageStoreBase
    with _$ProductEditPageStore;

abstract class _ProductEditPageStoreBase with Store {
  final ProductStore productStore;

  int id;

  @observable
  String name;

  @observable
  String price;

  @observable
  bool triedToCompleteTheForm = false;

  _ProductEditPageStoreBase(
    ProductEntity initialEntity, {
    required this.productStore,
  })  : id = initialEntity.id,
        name = initialEntity.name,
        price = initialEntity.price.toString();

  Future<ProductEntity?> saveForm() async {
    setTriedToCompleteTheForm();

    if (!isFormValid) return null;

    final formData = convertFormData();

    final savedModel = await productStore.set(formData);

    return savedModel;
  }

  ProductEntity convertFormData() {
    return ProductEntity(
      id: id,
      name: name,
      price: num.tryParse(price)?.toDouble() ?? 0,
    );
  }

  @action
  void setName(String value) => name = value;

  @action
  void setPrice(String value) => price = value;

  @action
  void setTriedToCompleteTheForm() => triedToCompleteTheForm = true;

  @computed
  bool get isNameValid => name.isNotEmpty && name.length > 1;

  @computed
  bool get isPriceValid =>
      price.isNotEmpty && num.tryParse(price) != null && num.parse(price) > 0;

  @computed
  bool get isFormValid => isNameValid && isPriceValid;

  @computed
  String? get nameFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      if (name.isEmpty) {
        message = FieldErrorMessages.requiredField;
      } else if (!isNameValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get priceFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      if (price.isEmpty) {
        message = FieldErrorMessages.requiredField;
      } else if (!isPriceValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }
}
