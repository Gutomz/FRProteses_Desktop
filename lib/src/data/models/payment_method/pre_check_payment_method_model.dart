import 'package:frproteses/src/data/models/payment_method_model.dart';
import 'package:frproteses/src/domain/entities/payment_method/pre_check_payment_method_entity.dart';

class PreCheckPaymentMethodModel extends PreCheckPaymentMethodEntity
    implements PaymentMethodModel {
  PreCheckPaymentMethodModel({required String number, required String dayFor})
      : super(number: number, dayFor: dayFor);

  factory PreCheckPaymentMethodModel.copyFrom(
    PreCheckPaymentMethodEntity preCheckPaymentMethodEntity,
  ) {
    return PreCheckPaymentMethodModel(
      number: preCheckPaymentMethodEntity.number,
      dayFor: preCheckPaymentMethodEntity.dayFor,
    );
  }

  factory PreCheckPaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PreCheckPaymentMethodModel(
      number: json["number"] as String,
      dayFor: json["dayFor"] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "number": number,
      "dayFor": dayFor,
    };
  }
}
