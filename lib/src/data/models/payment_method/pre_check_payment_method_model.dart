import 'package:frproteses/src/core/utils/constants.dart';
import 'package:frproteses/src/data/models/payment_method_model.dart';
import 'package:frproteses/src/domain/entities/payment_method/pre_check_payment_method_entity.dart';

class PreCheckPaymentMethodModel extends PreCheckPaymentMethodEntity
    implements PaymentMethodModel {
  PreCheckPaymentMethodModel({
    required String number,
    required String goodForDate,
  }) : super(number: number, goodForDate: goodForDate);

  factory PreCheckPaymentMethodModel.copyFrom(
    PreCheckPaymentMethodEntity preCheckPaymentMethodEntity,
  ) {
    return PreCheckPaymentMethodModel(
      number: preCheckPaymentMethodEntity.number,
      goodForDate: preCheckPaymentMethodEntity.goodForDate,
    );
  }

  factory PreCheckPaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PreCheckPaymentMethodModel(
      number: json["number"] as String,
      goodForDate: json["goodForDate"] as String,
    );
  }

  factory PreCheckPaymentMethodModel.fromString(String str) {
    final fields = str.split(SplitFieldsPattern.paymentMethodModelPattern);
    return PreCheckPaymentMethodModel(
      number: fields[1],
      goodForDate: fields[2],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "number": number,
      "goodForDate": goodForDate,
    };
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.paymentMethodModelPattern;
    final str = StringBuffer();
    str.write("${type.index}$pattern");
    str.write("$number$pattern");
    str.write("$goodForDate$pattern");
    return str.toString();
  }
}
