// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_edit_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderEditPageStore on _OrderEditPageStoreBase, Store {
  Computed<bool>? _$isCustomerValidComputed;

  @override
  bool get isCustomerValid =>
      (_$isCustomerValidComputed ??= Computed<bool>(() => super.isCustomerValid,
              name: '_OrderEditPageStoreBase.isCustomerValid'))
          .value;
  Computed<bool>? _$isOrderDateValidComputed;

  @override
  bool get isOrderDateValid => (_$isOrderDateValidComputed ??= Computed<bool>(
          () => super.isOrderDateValid,
          name: '_OrderEditPageStoreBase.isOrderDateValid'))
      .value;
  Computed<bool>? _$isDeliveryDateValidComputed;

  @override
  bool get isDeliveryDateValid => (_$isDeliveryDateValidComputed ??=
          Computed<bool>(() => super.isDeliveryDateValid,
              name: '_OrderEditPageStoreBase.isDeliveryDateValid'))
      .value;
  Computed<bool>? _$isPatientNameValidComputed;

  @override
  bool get isPatientNameValid => (_$isPatientNameValidComputed ??=
          Computed<bool>(() => super.isPatientNameValid,
              name: '_OrderEditPageStoreBase.isPatientNameValid'))
      .value;
  Computed<bool>? _$isModelTypeValidComputed;

  @override
  bool get isModelTypeValid => (_$isModelTypeValidComputed ??= Computed<bool>(
          () => super.isModelTypeValid,
          name: '_OrderEditPageStoreBase.isModelTypeValid'))
      .value;
  Computed<bool>? _$isScaleValidComputed;

  @override
  bool get isScaleValid =>
      (_$isScaleValidComputed ??= Computed<bool>(() => super.isScaleValid,
              name: '_OrderEditPageStoreBase.isScaleValid'))
          .value;
  Computed<bool>? _$isColorValidComputed;

  @override
  bool get isColorValid =>
      (_$isColorValidComputed ??= Computed<bool>(() => super.isColorValid,
              name: '_OrderEditPageStoreBase.isColorValid'))
          .value;
  Computed<bool>? _$isDentalArchValidComputed;

  @override
  bool get isDentalArchValid => (_$isDentalArchValidComputed ??= Computed<bool>(
          () => super.isDentalArchValid,
          name: '_OrderEditPageStoreBase.isDentalArchValid'))
      .value;
  Computed<bool>? _$isItemsValidComputed;

  @override
  bool get isItemsValid =>
      (_$isItemsValidComputed ??= Computed<bool>(() => super.isItemsValid,
              name: '_OrderEditPageStoreBase.isItemsValid'))
          .value;
  Computed<bool>? _$isNotesValidComputed;

  @override
  bool get isNotesValid =>
      (_$isNotesValidComputed ??= Computed<bool>(() => super.isNotesValid,
              name: '_OrderEditPageStoreBase.isNotesValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_OrderEditPageStoreBase.isFormValid'))
          .value;
  Computed<int?>? _$selectedProductIdComputed;

  @override
  int? get selectedProductId => (_$selectedProductIdComputed ??= Computed<int?>(
          () => super.selectedProductId,
          name: '_OrderEditPageStoreBase.selectedProductId'))
      .value;
  Computed<double?>? _$selectedProductUnitPriceComputed;

  @override
  double? get selectedProductUnitPrice =>
      (_$selectedProductUnitPriceComputed ??= Computed<double?>(
              () => super.selectedProductUnitPrice,
              name: '_OrderEditPageStoreBase.selectedProductUnitPrice'))
          .value;
  Computed<double?>? _$selectedProductTotalPriceComputed;

  @override
  double? get selectedProductTotalPrice =>
      (_$selectedProductTotalPriceComputed ??= Computed<double?>(
              () => super.selectedProductTotalPrice,
              name: '_OrderEditPageStoreBase.selectedProductTotalPrice'))
          .value;
  Computed<double>? _$orderTotalPriceComputed;

  @override
  double get orderTotalPrice => (_$orderTotalPriceComputed ??= Computed<double>(
          () => super.orderTotalPrice,
          name: '_OrderEditPageStoreBase.orderTotalPrice'))
      .value;
  Computed<String?>? _$customerFieldErrorMessageComputed;

  @override
  String? get customerFieldErrorMessage =>
      (_$customerFieldErrorMessageComputed ??= Computed<String?>(
              () => super.customerFieldErrorMessage,
              name: '_OrderEditPageStoreBase.customerFieldErrorMessage'))
          .value;
  Computed<String?>? _$orderDateFieldErrorMessageComputed;

  @override
  String? get orderDateFieldErrorMessage =>
      (_$orderDateFieldErrorMessageComputed ??= Computed<String?>(
              () => super.orderDateFieldErrorMessage,
              name: '_OrderEditPageStoreBase.orderDateFieldErrorMessage'))
          .value;
  Computed<String?>? _$patientNameFieldErrorMessageComputed;

  @override
  String? get patientNameFieldErrorMessage =>
      (_$patientNameFieldErrorMessageComputed ??= Computed<String?>(
              () => super.patientNameFieldErrorMessage,
              name: '_OrderEditPageStoreBase.patientNameFieldErrorMessage'))
          .value;
  Computed<String?>? _$modelTypeFieldErrorMessageComputed;

  @override
  String? get modelTypeFieldErrorMessage =>
      (_$modelTypeFieldErrorMessageComputed ??= Computed<String?>(
              () => super.modelTypeFieldErrorMessage,
              name: '_OrderEditPageStoreBase.modelTypeFieldErrorMessage'))
          .value;
  Computed<String?>? _$scaleFieldErrorMessageComputed;

  @override
  String? get scaleFieldErrorMessage => (_$scaleFieldErrorMessageComputed ??=
          Computed<String?>(() => super.scaleFieldErrorMessage,
              name: '_OrderEditPageStoreBase.scaleFieldErrorMessage'))
      .value;
  Computed<String?>? _$colorFieldErrorMessageComputed;

  @override
  String? get colorFieldErrorMessage => (_$colorFieldErrorMessageComputed ??=
          Computed<String?>(() => super.colorFieldErrorMessage,
              name: '_OrderEditPageStoreBase.colorFieldErrorMessage'))
      .value;
  Computed<String?>? _$dentalArchFieldErrorMessageComputed;

  @override
  String? get dentalArchFieldErrorMessage =>
      (_$dentalArchFieldErrorMessageComputed ??= Computed<String?>(
              () => super.dentalArchFieldErrorMessage,
              name: '_OrderEditPageStoreBase.dentalArchFieldErrorMessage'))
          .value;
  Computed<String?>? _$itemsFieldErrorMessageComputed;

  @override
  String? get itemsFieldErrorMessage => (_$itemsFieldErrorMessageComputed ??=
          Computed<String?>(() => super.itemsFieldErrorMessage,
              name: '_OrderEditPageStoreBase.itemsFieldErrorMessage'))
      .value;
  Computed<String?>? _$notesFieldErrorMessageComputed;

  @override
  String? get notesFieldErrorMessage => (_$notesFieldErrorMessageComputed ??=
          Computed<String?>(() => super.notesFieldErrorMessage,
              name: '_OrderEditPageStoreBase.notesFieldErrorMessage'))
      .value;

  final _$statusTypeAtom = Atom(name: '_OrderEditPageStoreBase.statusType');

  @override
  OrderStatusType get statusType {
    _$statusTypeAtom.reportRead();
    return super.statusType;
  }

  @override
  set statusType(OrderStatusType value) {
    _$statusTypeAtom.reportWrite(value, super.statusType, () {
      super.statusType = value;
    });
  }

  final _$customerEntityAtom =
      Atom(name: '_OrderEditPageStoreBase.customerEntity');

  @override
  CustomerEntity? get customerEntity {
    _$customerEntityAtom.reportRead();
    return super.customerEntity;
  }

  @override
  set customerEntity(CustomerEntity? value) {
    _$customerEntityAtom.reportWrite(value, super.customerEntity, () {
      super.customerEntity = value;
    });
  }

  final _$orderDateAtom = Atom(name: '_OrderEditPageStoreBase.orderDate');

  @override
  String get orderDate {
    _$orderDateAtom.reportRead();
    return super.orderDate;
  }

  @override
  set orderDate(String value) {
    _$orderDateAtom.reportWrite(value, super.orderDate, () {
      super.orderDate = value;
    });
  }

  final _$deliveryDateAtom = Atom(name: '_OrderEditPageStoreBase.deliveryDate');

  @override
  String get deliveryDate {
    _$deliveryDateAtom.reportRead();
    return super.deliveryDate;
  }

  @override
  set deliveryDate(String value) {
    _$deliveryDateAtom.reportWrite(value, super.deliveryDate, () {
      super.deliveryDate = value;
    });
  }

  final _$patientNameAtom = Atom(name: '_OrderEditPageStoreBase.patientName');

  @override
  String get patientName {
    _$patientNameAtom.reportRead();
    return super.patientName;
  }

  @override
  set patientName(String value) {
    _$patientNameAtom.reportWrite(value, super.patientName, () {
      super.patientName = value;
    });
  }

  final _$modelTypeAtom = Atom(name: '_OrderEditPageStoreBase.modelType');

  @override
  OrderModelType? get modelType {
    _$modelTypeAtom.reportRead();
    return super.modelType;
  }

  @override
  set modelType(OrderModelType? value) {
    _$modelTypeAtom.reportWrite(value, super.modelType, () {
      super.modelType = value;
    });
  }

  final _$scaleAtom = Atom(name: '_OrderEditPageStoreBase.scale');

  @override
  String get scale {
    _$scaleAtom.reportRead();
    return super.scale;
  }

  @override
  set scale(String value) {
    _$scaleAtom.reportWrite(value, super.scale, () {
      super.scale = value;
    });
  }

  final _$colorAtom = Atom(name: '_OrderEditPageStoreBase.color');

  @override
  String get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(String value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$dentalArchEntityAtom =
      Atom(name: '_OrderEditPageStoreBase.dentalArchEntity');

  @override
  DentalArchEntity get dentalArchEntity {
    _$dentalArchEntityAtom.reportRead();
    return super.dentalArchEntity;
  }

  @override
  set dentalArchEntity(DentalArchEntity value) {
    _$dentalArchEntityAtom.reportWrite(value, super.dentalArchEntity, () {
      super.dentalArchEntity = value;
    });
  }

  final _$selectedProductAtom =
      Atom(name: '_OrderEditPageStoreBase.selectedProduct');

  @override
  ProductEntity? get selectedProduct {
    _$selectedProductAtom.reportRead();
    return super.selectedProduct;
  }

  @override
  set selectedProduct(ProductEntity? value) {
    _$selectedProductAtom.reportWrite(value, super.selectedProduct, () {
      super.selectedProduct = value;
    });
  }

  final _$selectedQuantityAtom =
      Atom(name: '_OrderEditPageStoreBase.selectedQuantity');

  @override
  int get selectedQuantity {
    _$selectedQuantityAtom.reportRead();
    return super.selectedQuantity;
  }

  @override
  set selectedQuantity(int value) {
    _$selectedQuantityAtom.reportWrite(value, super.selectedQuantity, () {
      super.selectedQuantity = value;
    });
  }

  final _$notesAtom = Atom(name: '_OrderEditPageStoreBase.notes');

  @override
  String get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(String value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  final _$triedToCompleteTheFormAtom =
      Atom(name: '_OrderEditPageStoreBase.triedToCompleteTheForm');

  @override
  bool get triedToCompleteTheForm {
    _$triedToCompleteTheFormAtom.reportRead();
    return super.triedToCompleteTheForm;
  }

  @override
  set triedToCompleteTheForm(bool value) {
    _$triedToCompleteTheFormAtom
        .reportWrite(value, super.triedToCompleteTheForm, () {
      super.triedToCompleteTheForm = value;
    });
  }

  final _$closeOrderAsyncAction =
      AsyncAction('_OrderEditPageStoreBase.closeOrder');

  @override
  Future<bool> closeOrder() {
    return _$closeOrderAsyncAction.run(() => super.closeOrder());
  }

  final _$_OrderEditPageStoreBaseActionController =
      ActionController(name: '_OrderEditPageStoreBase');

  @override
  void setCustomer(CustomerEntity? value) {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.setCustomer');
    try {
      return super.setCustomer(value);
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderDate(String value) {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.setOrderDate');
    try {
      return super.setOrderDate(value);
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDeliveryDate(String value) {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.setDeliveryDate');
    try {
      return super.setDeliveryDate(value);
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPatientName(String value) {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.setPatientName');
    try {
      return super.setPatientName(value);
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModelType(OrderModelType? value) {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.setModelType');
    try {
      return super.setModelType(value);
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScale(String value) {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.setScale');
    try {
      return super.setScale(value);
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setColor(String value) {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.setColor');
    try {
      return super.setColor(value);
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTeeth(DentalArchType key, {bool value = false}) {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.setTeeth');
    try {
      return super.setTeeth(key, value: value);
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedProduct(ProductEntity? value) {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.setSelectedProduct');
    try {
      return super.setSelectedProduct(value);
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedQuantity(int? value) {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.setSelectedQuantity');
    try {
      return super.setSelectedQuantity(value);
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNotes(String value) {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.setNotes');
    try {
      return super.setNotes(value);
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTriedToCompleteTheForm() {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.setTriedToCompleteTheForm');
    try {
      return super.setTriedToCompleteTheForm();
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSelectedProduct() {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.addSelectedProduct');
    try {
      return super.addSelectedProduct();
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(int id) {
    final _$actionInfo = _$_OrderEditPageStoreBaseActionController.startAction(
        name: '_OrderEditPageStoreBase.removeItem');
    try {
      return super.removeItem(id);
    } finally {
      _$_OrderEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusType: ${statusType},
customerEntity: ${customerEntity},
orderDate: ${orderDate},
deliveryDate: ${deliveryDate},
patientName: ${patientName},
modelType: ${modelType},
scale: ${scale},
color: ${color},
dentalArchEntity: ${dentalArchEntity},
selectedProduct: ${selectedProduct},
selectedQuantity: ${selectedQuantity},
notes: ${notes},
triedToCompleteTheForm: ${triedToCompleteTheForm},
isCustomerValid: ${isCustomerValid},
isOrderDateValid: ${isOrderDateValid},
isDeliveryDateValid: ${isDeliveryDateValid},
isPatientNameValid: ${isPatientNameValid},
isModelTypeValid: ${isModelTypeValid},
isScaleValid: ${isScaleValid},
isColorValid: ${isColorValid},
isDentalArchValid: ${isDentalArchValid},
isItemsValid: ${isItemsValid},
isNotesValid: ${isNotesValid},
isFormValid: ${isFormValid},
selectedProductId: ${selectedProductId},
selectedProductUnitPrice: ${selectedProductUnitPrice},
selectedProductTotalPrice: ${selectedProductTotalPrice},
orderTotalPrice: ${orderTotalPrice},
customerFieldErrorMessage: ${customerFieldErrorMessage},
orderDateFieldErrorMessage: ${orderDateFieldErrorMessage},
patientNameFieldErrorMessage: ${patientNameFieldErrorMessage},
modelTypeFieldErrorMessage: ${modelTypeFieldErrorMessage},
scaleFieldErrorMessage: ${scaleFieldErrorMessage},
colorFieldErrorMessage: ${colorFieldErrorMessage},
dentalArchFieldErrorMessage: ${dentalArchFieldErrorMessage},
itemsFieldErrorMessage: ${itemsFieldErrorMessage},
notesFieldErrorMessage: ${notesFieldErrorMessage}
    ''';
  }
}
