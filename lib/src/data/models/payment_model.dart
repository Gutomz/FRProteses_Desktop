import 'package:frproteses/src/data/models/customer_model.dart';
import 'package:frproteses/src/data/models/payment_method_model.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';
import 'package:frproteses/src/domain/entities/payment_method_entity.dart';

class PaymentModel extends PaymentEntity {
  PaymentModel({
    required int id,
    required String date,
    required CustomerEntity customer,
    required double value,
    required PaymentMethodEntity method,
    required String notes,
  }) : super(
          id: id,
          date: date,
          customer: customer,
          value: value,
          method: method,
          notes: notes,
        );

  factory PaymentModel.copyFrom(PaymentEntity paymentEntity) {
    return PaymentModel(
      id: paymentEntity.id,
      date: paymentEntity.date,
      customer: paymentEntity.customer,
      value: paymentEntity.value,
      method: paymentEntity.method,
      notes: paymentEntity.notes,
    );
  }

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: (json["id"] as num).toInt(),
      date: json["date"],
      customer: CustomerModel.fromJson(json["customer"]),
      value: (json["value"] as num).toDouble(),
      method: PaymentMethodModel.fromJson(json),
      notes: json["notes"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "date": date,
      "customer": CustomerModel.copyFrom(customer).toJson(),
      "value": value,
      "method": PaymentMethodModel.copyFrom(method).toJson(),
      "notes": notes,
    };
  }
}
