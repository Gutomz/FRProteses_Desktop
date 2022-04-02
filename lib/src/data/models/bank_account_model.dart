import 'package:frproteses/src/core/utils/constants.dart';
import 'package:frproteses/src/data/models/customer_model.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';

class BankAccountModel extends BankAccountEntity {
  BankAccountModel({
    required int id,
    required CustomerModel customerModel,
    required double balance,
    required double outstandingBalance,
    required int ordersCount,
    required double ordersTotalValue,
    required int paymentsCount,
    required double paymentsTotalValue,
  }) : super(
          id: id,
          customerEntity: customerModel,
          balance: balance,
          outstandingBalance: outstandingBalance,
          ordersCount: ordersCount,
          ordersTotalValue: ordersTotalValue,
          paymentsCount: paymentsCount,
          paymentsTotalValue: paymentsTotalValue,
        );

  factory BankAccountModel.empty(
      {required int id, required CustomerModel customerModel}) {
    return BankAccountModel.copyFrom(
        BankAccountEntity.empty(id, customerModel));
  }

  factory BankAccountModel.copyFrom(BankAccountEntity bankAccountEntity) {
    return BankAccountModel(
      id: bankAccountEntity.id,
      customerModel: CustomerModel.copyFrom(bankAccountEntity.customerEntity),
      balance: bankAccountEntity.balance,
      outstandingBalance: bankAccountEntity.outstandingBalance,
      ordersCount: bankAccountEntity.ordersCount,
      ordersTotalValue: bankAccountEntity.ordersTotalValue,
      paymentsCount: bankAccountEntity.paymentsCount,
      paymentsTotalValue: bankAccountEntity.paymentsTotalValue,
    );
  }

  factory BankAccountModel.fromString(String str) {
    final fields = str.split(SplitFieldsPattern.bankAccountModelPattern);

    try {
      return BankAccountModel(
        id: num.parse(fields[0]).toInt(),
        customerModel: CustomerModel.fromString(fields[1]),
        balance: num.parse(fields[2]).toDouble(),
        outstandingBalance: num.parse(fields[3]).toDouble(),
        ordersCount: num.parse(fields[4]).toInt(),
        ordersTotalValue: num.parse(fields[5]).toDouble(),
        paymentsCount: num.parse(fields[6]).toInt(),
        paymentsTotalValue: num.parse(fields[7]).toDouble(),
      );
    } on Exception {
      return BankAccountModel.empty(
        id: 0,
        customerModel: CustomerModel.empty(),
      );
    }
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.bankAccountModelPattern;
    final str = StringBuffer();
    str.write("$id$pattern");
    str.write("${CustomerModel.copyFrom(customerEntity).toString()}$pattern");
    str.write("$balance$pattern");
    str.write("$outstandingBalance$pattern");
    str.write("$ordersCount$pattern");
    str.write("$ordersTotalValue$pattern");
    str.write("$paymentsCount$pattern");
    str.write("$paymentsTotalValue");
    return str.toString();
  }
}
