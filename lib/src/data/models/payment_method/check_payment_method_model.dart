import 'package:frproteses/src/core/utils/constants.dart';
import 'package:frproteses/src/data/models/payment_method_model.dart';
import 'package:frproteses/src/domain/entities/payment_method/check_payment_method_entity.dart';

class CheckPaymentMethodModel extends CheckPaymentMethodEntity
    implements PaymentMethodModel {
  CheckPaymentMethodModel(String number) : super(number);

  factory CheckPaymentMethodModel.copyFrom(
    CheckPaymentMethodEntity checkPaymentMethodEntity,
  ) {
    return CheckPaymentMethodModel(checkPaymentMethodEntity.number);
  }

  factory CheckPaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return CheckPaymentMethodModel(json["number"] as String);
  }

  factory CheckPaymentMethodModel.fromString(String str) {
    final fields = str.split(SplitFieldsPattern.paymentMethodModelPattern);
    return CheckPaymentMethodModel(fields[1]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "number": number,
    };
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.paymentMethodModelPattern;
    final str = StringBuffer();
    str.write("${type.index}$pattern");
    str.write("$number$pattern");
    return str.toString();
  }
}
