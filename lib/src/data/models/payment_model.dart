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
