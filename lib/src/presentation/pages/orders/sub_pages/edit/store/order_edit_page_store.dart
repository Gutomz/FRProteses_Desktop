import 'package:frproteses/src/core/enums/dental_arch_type.dart';
import 'package:frproteses/src/core/enums/order_model_type.dart';
import 'package:frproteses/src/core/enums/order_status_type.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/entities/dental_arch_entity.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/domain/entities/order_item_entity.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/stores/customer_store.dart';
import 'package:frproteses/src/presentation/stores/order_store.dart';
import 'package:frproteses/src/presentation/stores/product_store.dart';
import 'package:mobx/mobx.dart';
part 'order_edit_page_store.g.dart';

class OrderEditPageStore = _OrderEditPageStoreBase with _$OrderEditPageStore;

abstract class _OrderEditPageStoreBase with Store {
  final OrderStore orderStore;
  final CustomerStore customerStore;
  final ProductStore productStore;

  ObservableList<CustomerEntity> customers;
  ObservableList<ProductEntity> products;
  ObservableList<ProductEntity> selectedProducts;

  int id;

  @observable
  OrderStatusType statusType;

  @observable
  CustomerEntity? customerEntity;

  @observable
  String orderDate;

  @observable
  String deliveryDate;

  @observable
  String patientName;

  @observable
  OrderModelType? modelType;

  @observable
  String scale;

  @observable
  String color;

  @observable
  DentalArchEntity dentalArchEntity;

  @observable
  ProductEntity? selectedProduct;

  @observable
  int selectedQuantity;

  ObservableList<OrderItemEntity> items;

  @observable
  String notes;

  @observable
  bool triedToCompleteTheForm = false;

  _OrderEditPageStoreBase(
    OrderEntity initialEntity, {
    required this.orderStore,
    required this.customerStore,
    required this.productStore,
  })  : id = initialEntity.id,
        statusType = initialEntity.statusType,
        customerEntity = initialEntity.customerEntity,
        orderDate = initialEntity.orderDate.isEmpty
            ? DateTime.now().formatDate()
            : initialEntity.orderDate,
        deliveryDate = initialEntity.deliveryDate,
        patientName = initialEntity.patientName,
        modelType = initialEntity.modelType,
        scale = initialEntity.scale,
        color = initialEntity.color,
        dentalArchEntity = initialEntity.dentalArchEntity,
        selectedQuantity = 1,
        items = initialEntity.itemsEntity.asObservable(),
        notes = initialEntity.notes,
        customers = List<CustomerEntity>.empty(growable: true).asObservable(),
        products = List<ProductEntity>.empty(growable: true).asObservable(),
        selectedProducts =
            List<ProductEntity>.empty(growable: true).asObservable() {
    if (initialEntity.statusType.isEqual(OrderStatusType.open)) {
      loadData();
    }
  }

  Future<void> loadData() async {
    final _customersList = await customerStore.getAll();
    final _productsList = await productStore.getAll();

    if (_customersList != null && _customersList.isNotEmpty) {
      customers.addAll(_customersList);
    }

    if (_productsList != null && _productsList.isNotEmpty) {
      for (final product in _productsList) {
        if (items.exist((p0) => p0.id == product.id)) {
          selectedProducts.add(product);
        } else {
          products.add(product);
        }
      }

      if (products.isNotEmpty) {
        setSelectedProduct(products.first);
      }
    }
  }

  Future<OrderEntity?> saveForm() async {
    setTriedToCompleteTheForm();

    if (!isFormValid) return null;

    final formData = convertFormData();

    final savedModel = await orderStore.set(formData);

    return savedModel;
  }

  OrderEntity convertFormData() {
    return OrderEntity(
      id: id,
      statusType: statusType,
      customerEntity: customerEntity!,
      orderDate: orderDate,
      deliveryDate: deliveryDate,
      patientName: patientName,
      modelType: modelType,
      scale: scale,
      color: color,
      dentalArchEntity: dentalArchEntity,
      itemsEntity: items,
      notes: notes,
    );
  }

  @action
  void setCustomer(CustomerEntity? value) => customerEntity = value;

  @action
  void setOrderDate(String value) => orderDate = value;

  @action
  void setDeliveryDate(String value) => deliveryDate = value;

  @action
  void setPatientName(String value) => patientName = value;

  @action
  void setModelType(OrderModelType? value) => modelType = value;

  @action
  void setScale(String value) => scale = value;

  @action
  void setColor(String value) => color = value;

  @action
  void setTeeth(DentalArchType key, {bool value = false}) =>
      dentalArchEntity.setTeeth(key, value: value);

  @action
  void setSelectedProduct(ProductEntity? value) {
    selectedProduct = value;
    setSelectedQuantity(null);
  }

  @action
  void setSelectedQuantity(int? value) {
    if (value == null) {
      selectedQuantity = 1;
      return;
    }

    selectedQuantity = value;
  }

  @action
  void setNotes(String value) => notes = value;

  @action
  void setTriedToCompleteTheForm() => triedToCompleteTheForm = true;

  @action
  void addSelectedProduct() {
    if (selectedProduct == null) return;
    final item = OrderItemEntity(
      id: selectedProduct!.id,
      productEntity: selectedProduct!,
      quantity: selectedQuantity,
      unitPrice: selectedProduct!.price,
    );

    selectedProducts
        .add(products.firstWhere((e) => e.id == selectedProduct!.id));
    products.removeWhere((e) => e.id == selectedProduct!.id);

    items.add(item);

    if (products.isEmpty) {
      setSelectedProduct(null);
    } else {
      setSelectedProduct(products.first);
    }
  }

  @action
  void removeItem(int id) {
    items.removeWhere((e) => e.id == id);
    products.add(selectedProducts.firstWhere((e) => e.id == id));
    selectedProducts.removeWhere((e) => e.id == id);

    if (products.isEmpty) {
      setSelectedProduct(null);
    } else {
      setSelectedProduct(products.first);
    }
  }

  @action
  Future<void> closeOrder() async {
    final model = await orderStore.close(id);

    if (model == null) {
      // TODO - Show error message
      return;
    }

    statusType = model.statusType;
    deliveryDate = model.deliveryDate;
    setSelectedProduct(null);
    products.clear();
    selectedProducts.clear();
    customers.clear();
  }

  @computed
  bool get isCustomerValid => customerEntity != null && customerEntity!.id != 0;

  @computed
  bool get isOrderDateValid => orderDate.toDateTime() != null;

  @computed
  bool get isDeliveryDateValid =>
      deliveryDate.isEmpty || deliveryDate.toDateTime() != null;

  @computed
  bool get isPatientNameValid => true;

  @computed
  bool get isModelTypeValid => true;

  @computed
  bool get isScaleValid => true;

  @computed
  bool get isColorValid => true;

  @computed
  bool get isDentalArchValid => true;

  @computed
  bool get isItemsValid => items.isNotEmpty;

  @computed
  bool get isNotesValid => true;

  @computed
  bool get isFormValid =>
      isCustomerValid &&
      isOrderDateValid &&
      isDeliveryDateValid &&
      isPatientNameValid &&
      isModelTypeValid &&
      isScaleValid &&
      isColorValid &&
      isDentalArchValid &&
      isItemsValid &&
      isNotesValid;

  @computed
  int? get selectedProductId => selectedProduct?.id;

  @computed
  double? get selectedProductUnitPrice => selectedProduct?.price;

  @computed
  double? get selectedProductTotalPrice {
    if (selectedProduct == null) return null;

    return selectedProduct!.price * selectedQuantity;
  }

  @computed
  double get orderTotalPrice {
    double _value = 0;
    for (final item in items) {
      _value += item.unitPrice * item.quantity;
    }

    return _value;
  }

  @computed
  String? get customerFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      if (customerEntity == null || customerEntity!.id == 0) {
        message = FieldErrorMessages.requiredField;
      } else if (!isCustomerValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get orderDateFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      if (orderDate.toDateTime() == null) {
        message = FieldErrorMessages.requiredField;
      } else if (!isOrderDateValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get patientNameFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* not required field */
      if (!isPatientNameValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get modelTypeFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* not required field */
      if (!isModelTypeValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get scaleFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* not required field */
      if (!isScaleValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get colorFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* not required field */
      if (!isColorValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get dentalArchFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* not required field */
      if (!isDentalArchValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get itemsFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      if (items.isEmpty) {
        message = FieldErrorMessages.requiredField;
      } else if (!isPatientNameValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get notesFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* not required field */
      if (!isNotesValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }
}
