import 'package:frproteses/src/core/utils/constants.dart';
import 'package:frproteses/src/data/models/customer_model.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';

class BankAccountModel extends BankAccountEntity {
  BankAccountModel({
    required int id,
    required CustomerModel customerModel,
    required double balance,
    required double outstandingBalance,
  }) : super(
          id: id,
          customerEntity: customerModel,
          balance: balance,
          outstandingBalance: outstandingBalance,
        );

  factory BankAccountModel.empty() {
    return BankAccountModel(
      id: 0,
      customerModel: CustomerModel.empty(),
      balance: 0,
      outstandingBalance: 0,
    );
  }

  factory BankAccountModel.copyFrom(BankAccountEntity bankAccountEntity) {
    return BankAccountModel(
      id: bankAccountEntity.id,
      customerModel: CustomerModel.copyFrom(bankAccountEntity.customerEntity),
      balance: bankAccountEntity.balance,
      outstandingBalance: bankAccountEntity.outstandingBalance,
    );
  }

  factory BankAccountModel.fromJson(Map<String, dynamic> json) {
    return BankAccountModel(
      id: (json["id"] as num).toInt(),
      customerModel:
          CustomerModel.fromJson(json["customer"] as Map<String, dynamic>),
      balance: (json["balance"] as num).toDouble(),
      outstandingBalance: (json["outstandingBalance"] as num).toDouble(),
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
      );
    } on Exception {
      return BankAccountModel.empty();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "customer": CustomerModel.copyFrom(customerEntity).toJson(),
      "balance": balance,
      "outstandingBalance": outstandingBalance,
    };
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.bankAccountModelPattern;
    final str = StringBuffer();
    str.write("$id$pattern");
    str.write("${CustomerModel.copyFrom(customerEntity).toString()}$pattern");
    str.write("$balance$pattern");
    str.write("$outstandingBalance$pattern");
    return str.toString();
  }
}
