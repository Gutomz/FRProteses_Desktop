import 'package:frproteses/src/data/models/payment_method_model.dart';
import 'package:frproteses/src/domain/entities/payment_method/money_payment_method_entity.dart';

class MoneyPaymentMethodModel extends MoneyPaymentMethodEntity
    implements PaymentMethodModel {
  MoneyPaymentMethodModel();

  factory MoneyPaymentMethodModel.copyFrom(
      MoneyPaymentMethodEntity moneyPaymentMethodEntity) {
    return MoneyPaymentMethodModel();
  }

  factory MoneyPaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return MoneyPaymentMethodModel();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
    };
  }
}
