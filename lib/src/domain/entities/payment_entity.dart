import 'package:frproteses/src/domain/entities/payment_method_entity.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';

class PaymentEntity {
  int id;
  String date;
  CustomerEntity customer;
  double value;
  PaymentMethodEntity method;
  String notes;

  PaymentEntity({
    required this.id,
    required this.date,
    required this.customer,
    required this.value,
    required this.method,
    required this.notes,
  });
}
