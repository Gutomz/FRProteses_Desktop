import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';
import 'package:frproteses/src/domain/entities/payment_method/check_payment_method_entity.dart';
import 'package:frproteses/src/domain/entities/payment_method/money_payment_method_entity.dart';
import 'package:frproteses/src/domain/entities/payment_method/pre_check_payment_method_entity.dart';
import 'package:frproteses/src/domain/entities/payment_method_entity.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/stores/customer_store.dart';
import 'package:frproteses/src/presentation/stores/payment_store.dart';
import 'package:mobx/mobx.dart';
part 'payment_edit_page_store.g.dart';

class PaymentEditPageStore = _PaymentEditPageStoreBase
    with _$PaymentEditPageStore;

abstract class _PaymentEditPageStoreBase with Store {
  final PaymentStore paymentStore;
  final CustomerStore customerStore;

  ObservableList<CustomerEntity> customers = ObservableList();

  int id;

  @observable
  CustomerEntity? customer;

  @observable
  String date = "";

  @observable
  PaymentMethodType? paymentMethod;

  @observable
  String paidValue = "";

  @observable
  String checkNum = "";

  @observable
  String goodForDate = "";

  @observable
  String notes = "";

  @observable
  bool triedToCompleteTheForm = false;

  _PaymentEditPageStoreBase(
    PaymentEntity initialEntity, {
    required this.paymentStore,
    required this.customerStore,
  })  : id = initialEntity.id,
        customer = initialEntity.customerEntity,
        date = initialEntity.date.isEmpty
            ? DateTime.now().formatDate()
            : initialEntity.date,
        paymentMethod = initialEntity.methodEntity.type,
        paidValue = initialEntity.value.toString(),
        notes = initialEntity.notes {
    _setInitialValues(initialEntity);
  }

  Future<void> _setInitialValues(PaymentEntity entity) async {
    switch (entity.methodEntity.type) {
      case PaymentMethodType.preCheck:
        final pm = entity.methodEntity as PreCheckPaymentMethodEntity;
        goodForDate = pm.goodForDate;
        checkNum = pm.number;
        break;
      case PaymentMethodType.check:
        final pm = entity.methodEntity as CheckPaymentMethodEntity;
        checkNum = pm.number;
        break;
      default:
        break;
    }

    final _list = await customerStore.getAll();

    if (_list != null) {
      customers.addAll(_list);
    }
  }

  Future<PaymentEntity?> saveForm({bool isNew = false}) async {
    setTriedToCompleteTheForm();

    if (!isFormValid) return null;

    final formData = convertFormData();

    final savedModel = await paymentStore.set(formData, isNew: isNew);

    return savedModel;
  }

  PaymentEntity convertFormData() {
    return PaymentEntity(
      id: id,
      customerEntity: customer!,
      date: date,
      methodEntity: convertPaymentMethod(),
      value: num.tryParse(paidValue)?.toDouble() ?? 0,
      notes: notes,
    );
  }

  PaymentMethodEntity convertPaymentMethod() {
    switch (paymentMethod) {
      case PaymentMethodType.check:
        return CheckPaymentMethodEntity(checkNum);
      case PaymentMethodType.preCheck:
        return PreCheckPaymentMethodEntity(
          number: checkNum,
          goodForDate: goodForDate,
        );
      case PaymentMethodType.money:
      default:
        return MoneyPaymentMethodEntity();
    }
  }

  @action
  void setCustomer(CustomerEntity? value) => customer = value;

  @action
  void setDate(String value) => date = value;

  @action
  void setMethod(PaymentMethodType? value) => paymentMethod = value;

  @action
  void setPaidValue(String _value) => paidValue = _value;

  @action
  void setCheckNum(String value) => checkNum = value;

  @action
  void setGoodForDate(String value) => goodForDate = value;

  @action
  void setNotes(String value) => notes = value;

  @action
  void setTriedToCompleteTheForm() => triedToCompleteTheForm = true;

  @computed
  bool get isCustomerValid => customer != null && customer!.id != 0;

  @computed
  bool get isDateValid => date.toDateTime() != null;

  @computed
  bool get isMethodValid => paymentMethod != null;

  @computed
  bool get isPaidValueValid =>
      paidValue.isNotEmpty &&
      num.tryParse(paidValue) != null &&
      num.parse(paidValue) > 0;

  @computed
  bool get isCheckNumValid =>
      paymentMethod == null ||
      (!paymentMethod!.isEqual(PaymentMethodType.check) &&
          !paymentMethod!.isEqual(PaymentMethodType.preCheck)) ||
      checkNum.isNotEmpty;

  @computed
  bool get isGoodForDateValid =>
      paymentMethod == null ||
      !paymentMethod!.isEqual(PaymentMethodType.preCheck) ||
      goodForDate.toDateTime() != null;

  @computed
  bool get isNotesValid => true;

  @computed
  bool get isFormValid =>
      isCustomerValid &&
      isDateValid &&
      isMethodValid &&
      isPaidValueValid &&
      isCheckNumValid &&
      isGoodForDateValid &&
      isNotesValid;

  @computed
  String? get customerFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      if (customer == null || customer!.id == 0) {
        message = FieldErrorMessages.requiredField;
      } else if (!isCustomerValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get dateFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      if (date.isEmpty) {
        message = FieldErrorMessages.requiredField;
      } else if (!isDateValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get methodFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      if (paymentMethod == null) {
        message = FieldErrorMessages.requiredField;
      } else if (!isMethodValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get paidValueFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      final numValue = double.tryParse(paidValue) ?? 0;
      if (numValue == 0) {
        message = FieldErrorMessages.requiredField;
      } else if (!isPaidValueValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get checkNumFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      if (checkNum.isEmpty &&
          paymentMethod != null &&
          (paymentMethod!.isEqual(PaymentMethodType.check) ||
              paymentMethod!.isEqual(PaymentMethodType.preCheck))) {
        message = FieldErrorMessages.requiredField;
      } else if (!isCheckNumValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get goodForDateFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      if (goodForDate.toDateTime() == null &&
          paymentMethod != null &&
          paymentMethod!.isEqual(PaymentMethodType.preCheck)) {
        message = FieldErrorMessages.requiredField;
      } else if (!isGoodForDateValid) {
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

  @computed
  bool get isCheckNumFieldEnabled =>
      paymentMethod != null &&
      (paymentMethod!.isEqual(PaymentMethodType.check) ||
          paymentMethod!.isEqual(PaymentMethodType.preCheck));

  @computed
  bool get isGoodForDateFieldEnabled =>
      paymentMethod != null &&
      paymentMethod!.isEqual(PaymentMethodType.preCheck);
}
