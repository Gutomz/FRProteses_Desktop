import 'package:frproteses/src/core/utils/constants.dart';
import 'package:frproteses/src/data/models/customer_model.dart';
import 'package:frproteses/src/data/models/payment_method_model.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  PaymentModel({
    required int id,
    required String date,
    required CustomerModel customerModel,
    required double value,
    required PaymentMethodModel methodModel,
    required String notes,
  }) : super(
          id: id,
          date: date,
          customerEntity: customerModel,
          value: value,
          methodEntity: methodModel,
          notes: notes,
        );

  factory PaymentModel.empty() {
    return PaymentModel.copyFrom(PaymentEntity.empty(0));
  }

  factory PaymentModel.copyFrom(PaymentEntity paymentEntity) {
    return PaymentModel(
      id: paymentEntity.id,
      date: paymentEntity.date,
      customerModel: CustomerModel.copyFrom(paymentEntity.customerEntity),
      value: paymentEntity.value,
      methodModel: PaymentMethodModel.copyFrom(paymentEntity.methodEntity),
      notes: paymentEntity.notes,
    );
  }

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: (json["id"] as num).toInt(),
      date: json["date"] as String,
      customerModel:
          CustomerModel.fromJson(json["customer"] as Map<String, dynamic>),
      value: (json["value"] as num).toDouble(),
      methodModel:
          PaymentMethodModel.fromJson(json["method"] as Map<String, dynamic>),
      notes: json["notes"] as String,
    );
  }

  factory PaymentModel.fromString(String str) {
    final fields = str.split(SplitFieldsPattern.paymentModelPattern);

    try {
      return PaymentModel(
        id: num.parse(fields[0]).toInt(),
        date: fields[1],
        value: num.parse(fields[2]).toDouble(),
        customerModel: CustomerModel.fromString(fields[3]),
        methodModel: PaymentMethodModel.fromString(fields[4]),
        notes: fields[5],
      );
    } on Exception {
      return PaymentModel.empty();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "date": date,
      "customer": CustomerModel.copyFrom(customerEntity).toJson(),
      "value": value,
      "method": PaymentMethodModel.copyFrom(methodEntity).toJson(),
      "notes": notes,
    };
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.paymentModelPattern;
    final str = StringBuffer();
    str.write("$id$pattern");
    str.write("$date$pattern");
    str.write("$value$pattern");
    str.write("${CustomerModel.copyFrom(customerEntity).toString()}$pattern");
    str.write(
        "${PaymentMethodModel.copyFrom(methodEntity).toString()}$pattern");
    str.write("$notes$pattern");
    return str.toString();
  }
}
