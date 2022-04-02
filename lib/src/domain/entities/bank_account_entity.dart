import 'package:frproteses/src/domain/entities/customer_entity.dart';

class BankAccountEntity {
  int id;
  CustomerEntity customerEntity;
  double balance;
  double outstandingBalance;
  int ordersCount;
  double ordersTotalValue;
  int paymentsCount;
  double paymentsTotalValue;

  BankAccountEntity({
    required this.id,
    required this.customerEntity,
    required this.balance,
    required this.outstandingBalance,
    required this.ordersCount,
    required this.ordersTotalValue,
    required this.paymentsCount,
    required this.paymentsTotalValue,
  });

  factory BankAccountEntity.empty(int id, CustomerEntity customerEntity) {
    return BankAccountEntity(
      id: id,
      customerEntity: customerEntity,
      balance: 0,
      outstandingBalance: 0,
      ordersCount: 0,
      ordersTotalValue: 0,
      paymentsCount: 0,
      paymentsTotalValue: 0,
    );
  }

  double get difference => balance - outstandingBalance;
}
