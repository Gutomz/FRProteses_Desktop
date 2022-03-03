import 'package:frproteses/src/core/enums/payment_method_type.dart';

abstract class PaymentMethodEntity {
  PaymentMethodType type;

  PaymentMethodEntity(this.type);
}
