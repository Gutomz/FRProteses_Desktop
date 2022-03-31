import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/repositories/bank_account_repository.dart';

class PayBankAccount extends UseCase<void, PayBankAccountParams> {
  final IBankAccountRepository bankAccountRepository;

  PayBankAccount(this.bankAccountRepository);

  @override
  Future<Either<Failure, void>> call(PayBankAccountParams params) {
    return bankAccountRepository.pay(params.customerId, params.amount);
  }
}

class PayBankAccountParams {
  int customerId;
  double amount;

  PayBankAccountParams(this.customerId, this.amount);
}
