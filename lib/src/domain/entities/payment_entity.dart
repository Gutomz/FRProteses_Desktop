import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/entities/payment_method/money_payment_method_entity.dart';
import 'package:frproteses/src/domain/entities/payment_method_entity.dart';

class PaymentEntity {
  int id;
  String date;
  CustomerEntity customerEntity;
  double value;
  PaymentMethodEntity methodEntity;
  String notes;

  PaymentEntity({
    required this.id,
    required this.date,
    required this.customerEntity,
    required this.value,
    required this.methodEntity,
    required this.notes,
  });

  factory PaymentEntity.empty(int id) {
    return PaymentEntity(
      id: id,
      date: "",
      customerEntity: CustomerEntity.empty(0),
      value: 0,
      methodEntity: MoneyPaymentMethodEntity(),
      notes: "",
    );
  }
}
