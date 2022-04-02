import 'package:frproteses/src/core/utils/constants.dart';
import 'package:frproteses/src/data/models/payment_method_model.dart';
import 'package:frproteses/src/domain/entities/payment_method/money_payment_method_entity.dart';

class MoneyPaymentMethodModel extends MoneyPaymentMethodEntity
    implements PaymentMethodModel {
  MoneyPaymentMethodModel();

  factory MoneyPaymentMethodModel.copyFrom(
    // ignore: avoid_unused_constructor_parameters
    MoneyPaymentMethodEntity moneyPaymentMethodEntity,
  ) {
    return MoneyPaymentMethodModel();
  }

  // ignore: avoid_unused_constructor_parameters
  factory MoneyPaymentMethodModel.fromString(String str) {
    return MoneyPaymentMethodModel();
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.paymentMethodModelPattern;
    final str = StringBuffer();
    str.write("${type.index}$pattern");
    return str.toString();
  }
}
