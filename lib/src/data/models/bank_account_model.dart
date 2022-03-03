import 'package:frproteses/src/data/models/customer_model.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';

class BankAccountModel extends BankAccountEntity {
  BankAccountModel({
    required int id,
    required CustomerEntity customer,
    required double balance,
    required double outstandingBalance,
  }) : super(
          id: id,
          customer: customer,
          balance: balance,
          outstandingBalance: outstandingBalance,
        );

  factory BankAccountModel.copyFrom(BankAccountEntity bankAccountEntity) {
    return BankAccountModel(
      id: bankAccountEntity.id,
      customer: bankAccountEntity.customer,
      balance: bankAccountEntity.balance,
      outstandingBalance: bankAccountEntity.outstandingBalance,
    );
  }

  factory BankAccountModel.fromJson(Map<String, dynamic> json) {
    return BankAccountModel(
      id: (json["id"] as num).toInt(),
      customer:
          CustomerModel.fromJson(json["customer"] as Map<String, dynamic>),
      balance: (json["balance"] as num).toDouble(),
      outstandingBalance: (json["outstandingBalance"] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "customer": CustomerModel.copyFrom(customer).toJson(),
      "balance": balance,
      "outstandingBalance": outstandingBalance,
    };
  }
}
