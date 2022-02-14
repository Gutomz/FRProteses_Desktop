import 'package:frproteses/src/domain/entities/customer_entity.dart';

class BankAccountEntity {
  int id;
  CustomerEntity customer;
  double balance;
  double outstandingBalance;

  BankAccountEntity({
    required this.id,
    required this.customer,
    required this.balance,
    required this.outstandingBalance,
  });
}
