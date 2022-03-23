// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_edit_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentEditPageStore on _PaymentEditPageStoreBase, Store {
  Computed<bool>? _$isCustomerValidComputed;

  @override
  bool get isCustomerValid =>
      (_$isCustomerValidComputed ??= Computed<bool>(() => super.isCustomerValid,
              name: '_PaymentEditPageStoreBase.isCustomerValid'))
          .value;
  Computed<bool>? _$isDateValidComputed;

  @override
  bool get isDateValid =>
      (_$isDateValidComputed ??= Computed<bool>(() => super.isDateValid,
              name: '_PaymentEditPageStoreBase.isDateValid'))
          .value;
  Computed<bool>? _$isMethodValidComputed;

  @override
  bool get isMethodValid =>
      (_$isMethodValidComputed ??= Computed<bool>(() => super.isMethodValid,
              name: '_PaymentEditPageStoreBase.isMethodValid'))
          .value;
  Computed<bool>? _$isPaidValueValidComputed;

  @override
  bool get isPaidValueValid => (_$isPaidValueValidComputed ??= Computed<bool>(
          () => super.isPaidValueValid,
          name: '_PaymentEditPageStoreBase.isPaidValueValid'))
      .value;
  Computed<bool>? _$isCheckNumValidComputed;

  @override
  bool get isCheckNumValid =>
      (_$isCheckNumValidComputed ??= Computed<bool>(() => super.isCheckNumValid,
              name: '_PaymentEditPageStoreBase.isCheckNumValid'))
          .value;
  Computed<bool>? _$isGoodForDateValidComputed;

  @override
  bool get isGoodForDateValid => (_$isGoodForDateValidComputed ??=
          Computed<bool>(() => super.isGoodForDateValid,
              name: '_PaymentEditPageStoreBase.isGoodForDateValid'))
      .value;
  Computed<bool>? _$isNotesValidComputed;

  @override
  bool get isNotesValid =>
      (_$isNotesValidComputed ??= Computed<bool>(() => super.isNotesValid,
              name: '_PaymentEditPageStoreBase.isNotesValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_PaymentEditPageStoreBase.isFormValid'))
          .value;
  Computed<String?>? _$customerFieldErrorMessageComputed;

  @override
  String? get customerFieldErrorMessage =>
      (_$customerFieldErrorMessageComputed ??= Computed<String?>(
              () => super.customerFieldErrorMessage,
              name: '_PaymentEditPageStoreBase.customerFieldErrorMessage'))
          .value;
  Computed<String?>? _$dateFieldErrorMessageComputed;

  @override
  String? get dateFieldErrorMessage => (_$dateFieldErrorMessageComputed ??=
          Computed<String?>(() => super.dateFieldErrorMessage,
              name: '_PaymentEditPageStoreBase.dateFieldErrorMessage'))
      .value;
  Computed<String?>? _$methodFieldErrorMessageComputed;

  @override
  String? get methodFieldErrorMessage => (_$methodFieldErrorMessageComputed ??=
          Computed<String?>(() => super.methodFieldErrorMessage,
              name: '_PaymentEditPageStoreBase.methodFieldErrorMessage'))
      .value;
  Computed<String?>? _$paidValueFieldErrorMessageComputed;

  @override
  String? get paidValueFieldErrorMessage =>
      (_$paidValueFieldErrorMessageComputed ??= Computed<String?>(
              () => super.paidValueFieldErrorMessage,
              name: '_PaymentEditPageStoreBase.paidValueFieldErrorMessage'))
          .value;
  Computed<String?>? _$checkNumFieldErrorMessageComputed;

  @override
  String? get checkNumFieldErrorMessage =>
      (_$checkNumFieldErrorMessageComputed ??= Computed<String?>(
              () => super.checkNumFieldErrorMessage,
              name: '_PaymentEditPageStoreBase.checkNumFieldErrorMessage'))
          .value;
  Computed<String?>? _$goodForDateFieldErrorMessageComputed;

  @override
  String? get goodForDateFieldErrorMessage =>
      (_$goodForDateFieldErrorMessageComputed ??= Computed<String?>(
              () => super.goodForDateFieldErrorMessage,
              name: '_PaymentEditPageStoreBase.goodForDateFieldErrorMessage'))
          .value;
  Computed<String?>? _$notesFieldErrorMessageComputed;

  @override
  String? get notesFieldErrorMessage => (_$notesFieldErrorMessageComputed ??=
          Computed<String?>(() => super.notesFieldErrorMessage,
              name: '_PaymentEditPageStoreBase.notesFieldErrorMessage'))
      .value;
  Computed<bool>? _$isCheckNumFieldEnabledComputed;

  @override
  bool get isCheckNumFieldEnabled => (_$isCheckNumFieldEnabledComputed ??=
          Computed<bool>(() => super.isCheckNumFieldEnabled,
              name: '_PaymentEditPageStoreBase.isCheckNumFieldEnabled'))
      .value;
  Computed<bool>? _$isGoodForDateFieldEnabledComputed;

  @override
  bool get isGoodForDateFieldEnabled => (_$isGoodForDateFieldEnabledComputed ??=
          Computed<bool>(() => super.isGoodForDateFieldEnabled,
              name: '_PaymentEditPageStoreBase.isGoodForDateFieldEnabled'))
      .value;

  final _$customerAtom = Atom(name: '_PaymentEditPageStoreBase.customer');

  @override
  CustomerEntity? get customer {
    _$customerAtom.reportRead();
    return super.customer;
  }

  @override
  set customer(CustomerEntity? value) {
    _$customerAtom.reportWrite(value, super.customer, () {
      super.customer = value;
    });
  }

  final _$dateAtom = Atom(name: '_PaymentEditPageStoreBase.date');

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$paymentMethodAtom =
      Atom(name: '_PaymentEditPageStoreBase.paymentMethod');

  @override
  PaymentMethodType? get paymentMethod {
    _$paymentMethodAtom.reportRead();
    return super.paymentMethod;
  }

  @override
  set paymentMethod(PaymentMethodType? value) {
    _$paymentMethodAtom.reportWrite(value, super.paymentMethod, () {
      super.paymentMethod = value;
    });
  }

  final _$paidValueAtom = Atom(name: '_PaymentEditPageStoreBase.paidValue');

  @override
  String get paidValue {
    _$paidValueAtom.reportRead();
    return super.paidValue;
  }

  @override
  set paidValue(String value) {
    _$paidValueAtom.reportWrite(value, super.paidValue, () {
      super.paidValue = value;
    });
  }

  final _$checkNumAtom = Atom(name: '_PaymentEditPageStoreBase.checkNum');

  @override
  String get checkNum {
    _$checkNumAtom.reportRead();
    return super.checkNum;
  }

  @override
  set checkNum(String value) {
    _$checkNumAtom.reportWrite(value, super.checkNum, () {
      super.checkNum = value;
    });
  }

  final _$goodForDateAtom = Atom(name: '_PaymentEditPageStoreBase.goodForDate');

  @override
  String get goodForDate {
    _$goodForDateAtom.reportRead();
    return super.goodForDate;
  }

  @override
  set goodForDate(String value) {
    _$goodForDateAtom.reportWrite(value, super.goodForDate, () {
      super.goodForDate = value;
    });
  }

  final _$notesAtom = Atom(name: '_PaymentEditPageStoreBase.notes');

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
      Atom(name: '_PaymentEditPageStoreBase.triedToCompleteTheForm');

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

  final _$_PaymentEditPageStoreBaseActionController =
      ActionController(name: '_PaymentEditPageStoreBase');

  @override
  void setCustomer(CustomerEntity? value) {
    final _$actionInfo = _$_PaymentEditPageStoreBaseActionController
        .startAction(name: '_PaymentEditPageStoreBase.setCustomer');
    try {
      return super.setCustomer(value);
    } finally {
      _$_PaymentEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(String value) {
    final _$actionInfo = _$_PaymentEditPageStoreBaseActionController
        .startAction(name: '_PaymentEditPageStoreBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_PaymentEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMethod(PaymentMethodType? value) {
    final _$actionInfo = _$_PaymentEditPageStoreBaseActionController
        .startAction(name: '_PaymentEditPageStoreBase.setMethod');
    try {
      return super.setMethod(value);
    } finally {
      _$_PaymentEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaidValue(String _value) {
    final _$actionInfo = _$_PaymentEditPageStoreBaseActionController
        .startAction(name: '_PaymentEditPageStoreBase.setPaidValue');
    try {
      return super.setPaidValue(_value);
    } finally {
      _$_PaymentEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckNum(String value) {
    final _$actionInfo = _$_PaymentEditPageStoreBaseActionController
        .startAction(name: '_PaymentEditPageStoreBase.setCheckNum');
    try {
      return super.setCheckNum(value);
    } finally {
      _$_PaymentEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGoodForDate(String value) {
    final _$actionInfo = _$_PaymentEditPageStoreBaseActionController
        .startAction(name: '_PaymentEditPageStoreBase.setGoodForDate');
    try {
      return super.setGoodForDate(value);
    } finally {
      _$_PaymentEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNotes(String value) {
    final _$actionInfo = _$_PaymentEditPageStoreBaseActionController
        .startAction(name: '_PaymentEditPageStoreBase.setNotes');
    try {
      return super.setNotes(value);
    } finally {
      _$_PaymentEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTriedToCompleteTheForm() {
    final _$actionInfo =
        _$_PaymentEditPageStoreBaseActionController.startAction(
            name: '_PaymentEditPageStoreBase.setTriedToCompleteTheForm');
    try {
      return super.setTriedToCompleteTheForm();
    } finally {
      _$_PaymentEditPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customer: ${customer},
date: ${date},
paymentMethod: ${paymentMethod},
paidValue: ${paidValue},
checkNum: ${checkNum},
goodForDate: ${goodForDate},
notes: ${notes},
triedToCompleteTheForm: ${triedToCompleteTheForm},
isCustomerValid: ${isCustomerValid},
isDateValid: ${isDateValid},
isMethodValid: ${isMethodValid},
isPaidValueValid: ${isPaidValueValid},
isCheckNumValid: ${isCheckNumValid},
isGoodForDateValid: ${isGoodForDateValid},
isNotesValid: ${isNotesValid},
isFormValid: ${isFormValid},
customerFieldErrorMessage: ${customerFieldErrorMessage},
dateFieldErrorMessage: ${dateFieldErrorMessage},
methodFieldErrorMessage: ${methodFieldErrorMessage},
paidValueFieldErrorMessage: ${paidValueFieldErrorMessage},
checkNumFieldErrorMessage: ${checkNumFieldErrorMessage},
goodForDateFieldErrorMessage: ${goodForDateFieldErrorMessage},
notesFieldErrorMessage: ${notesFieldErrorMessage},
isCheckNumFieldEnabled: ${isCheckNumFieldEnabled},
isGoodForDateFieldEnabled: ${isGoodForDateFieldEnabled}
    ''';
  }
}
