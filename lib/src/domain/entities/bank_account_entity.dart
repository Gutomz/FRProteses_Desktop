import 'package:frproteses/src/domain/entities/customer_entity.dart';

class BankAccountEntity {
  int id;
  CustomerEntity customerEntity;
  double balance;
  double outstandingBalance;

  BankAccountEntity({
    required this.id,
    required this.customerEntity,
    required this.balance,
    required this.outstandingBalance,
  });

  factory BankAccountEntity.empty(int id, CustomerEntity customerEntity) {
    return BankAccountEntity(
      id: id,
      customerEntity: customerEntity,
      balance: 0,
      outstandingBalance: 0,
    );
  }

  double get difference => balance - outstandingBalance;
}
