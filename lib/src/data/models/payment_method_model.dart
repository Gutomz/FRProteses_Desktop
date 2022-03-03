import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/data/models/payment_method/check_payment_method_model.dart';
import 'package:frproteses/src/data/models/payment_method/money_payment_method_model.dart';
import 'package:frproteses/src/data/models/payment_method/pre_check_payment_method_model.dart';
import 'package:frproteses/src/domain/entities/payment_method/check_payment_method_entity.dart';
import 'package:frproteses/src/domain/entities/payment_method/money_payment_method_entity.dart';
import 'package:frproteses/src/domain/entities/payment_method/pre_check_payment_method_entity.dart';
import 'package:frproteses/src/domain/entities/payment_method_entity.dart';

abstract class PaymentMethodModel extends PaymentMethodEntity {
  factory PaymentMethodModel.copyFrom(PaymentMethodEntity paymentMethodEntity) {
    switch (paymentMethodEntity.type) {
      case PaymentMethodType.check:
        return CheckPaymentMethodModel.copyFrom(
          paymentMethodEntity as CheckPaymentMethodEntity,
        );
      case PaymentMethodType.preCheck:
        return PreCheckPaymentMethodModel.copyFrom(
          paymentMethodEntity as PreCheckPaymentMethodEntity,
        );
      case PaymentMethodType.money:
      default:
        return MoneyPaymentMethodModel.copyFrom(
          paymentMethodEntity as MoneyPaymentMethodEntity,
        );
    }
  }

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    switch (json["type"]) {
      case PaymentMethodType.check:
        return CheckPaymentMethodModel.fromJson(json);
      case PaymentMethodType.preCheck:
        return PreCheckPaymentMethodModel.fromJson(json);
      case PaymentMethodType.money:
      default:
        return MoneyPaymentMethodModel.fromJson(json);
    }
  }

  Map<String, dynamic> toJson();
}
