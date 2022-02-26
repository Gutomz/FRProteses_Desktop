import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/domain/entities/payment_method_entity.dart';

class CheckPaymentMethodEntity extends PaymentMethodEntity {
  String number;

  CheckPaymentMethodEntity(this.number) : super(PaymentMethodType.check);
}
