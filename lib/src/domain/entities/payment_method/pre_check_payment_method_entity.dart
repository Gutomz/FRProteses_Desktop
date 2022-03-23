import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/domain/entities/payment_method_entity.dart';

class PreCheckPaymentMethodEntity extends PaymentMethodEntity {
  String number;
  String goodForDate;

  PreCheckPaymentMethodEntity({
    required this.number,
    required this.goodForDate,
  }) : super(PaymentMethodType.preCheck);
}
