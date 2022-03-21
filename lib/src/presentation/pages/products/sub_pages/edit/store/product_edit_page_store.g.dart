// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_edit_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductEditPageStore on _ProductEditPageStoreBase, Store {
  Computed<bool>? _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: '_ProductEditPageStoreBase.isNameValid'))
          .value;
  Computed<bool>? _$isPriceValidComputed;

  @override
  bool get isPriceValid =>
      (_$isPriceValidComputed ??= Computed<bool>(() => super.isPriceValid,
              name: '_ProductEditPageStoreBase.isPriceValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ProductEditPageStoreBase.isFormValid'))
          .value;
  Computed<String?>? _$nameFieldErrorMessageComputed;

  @override
  String? get nameFieldErrorMessage => (_$nameFieldErrorMessageComputed ??=
          Computed<String?>(() => super.nameFieldErrorMessage,
              name: '_ProductEditPageStoreBase.nameFieldErrorMessage'))
      .value;
  Computed<String?>? _$priceFieldErrorMessageComputed;

  @override
  String? get priceFieldErrorMessage => (_$priceFieldErrorMessageComputed ??=
          Computed<String?>(() => super.priceFieldErrorMessage,
              name: '_ProductEditPageStoreBase.priceFieldErrorMessage'))
      .value;

  final _$nameAtom = Atom(name: '_ProductEditPageStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$priceAtom = Atom(name: '_ProductEditPageStoreBase.price');

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$triedToCompleteTheFormAtom =
      Atom(name: '_ProductEditPageStoreBase.triedToCompleteTheForm');

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

  final _$_ProductEditPageStoreBaseActionController =
      ActionController(name: '_ProductEditPageStoreBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_ProductEditPageStoreBaseActionController
        .startAction(name: '_ProductEditPageStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ProductEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_ProductEditPageStoreBaseActionController
        .startAction(name: '_ProductEditPageStoreBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_ProductEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTriedToCompleteTheForm() {
    final _$actionInfo =
        _$_ProductEditPageStoreBaseActionController.startAction(
            name: '_ProductEditPageStoreBase.setTriedToCompleteTheForm');
    try {
      return super.setTriedToCompleteTheForm();
    } finally {
      _$_ProductEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
price: ${price},
triedToCompleteTheForm: ${triedToCompleteTheForm},
isNameValid: ${isNameValid},
isPriceValid: ${isPriceValid},
isFormValid: ${isFormValid},
nameFieldErrorMessage: ${nameFieldErrorMessage},
priceFieldErrorMessage: ${priceFieldErrorMessage}
    ''';
  }
}
