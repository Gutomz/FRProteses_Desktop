import 'package:frproteses/src/data/models/payment_method_model.dart';
import 'package:frproteses/src/domain/entities/payment_method/check_payment_method_entity.dart';

class CheckPaymentMethodModel extends CheckPaymentMethodEntity
    implements PaymentMethodModel {
  CheckPaymentMethodModel(String number) : super(number);

  factory CheckPaymentMethodModel.copyFrom(
      CheckPaymentMethodEntity checkPaymentMethodEntity) {
    return CheckPaymentMethodModel(checkPaymentMethodEntity.number);
  }

  factory CheckPaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return CheckPaymentMethodModel(json["number"]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "number": number,
    };
  }
}
