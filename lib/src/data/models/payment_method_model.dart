import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/core/utils/constants.dart';
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

  factory PaymentMethodModel.fromString(String str) {
    final fields = str.split(SplitFieldsPattern.paymentMethodModelPattern);
    final type = PaymentMethodTypeExtension.parse(fields[0]);

    switch (type) {
      case PaymentMethodType.check:
        return CheckPaymentMethodModel.fromString(str);
      case PaymentMethodType.preCheck:
        return PreCheckPaymentMethodModel.fromString(str);
      case PaymentMethodType.money:
      default:
        return MoneyPaymentMethodModel.fromString(str);
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

  @override
  String toString();
}
