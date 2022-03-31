import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/repositories/bank_account_repository.dart';

class ChargeBankAccount extends UseCase<void, ChargeBankAccountParams> {
  final IBankAccountRepository bankAccountRepository;

  ChargeBankAccount(this.bankAccountRepository);

  @override
  Future<Either<Failure, void>> call(ChargeBankAccountParams params) {
    return bankAccountRepository.charge(params.customerId, params.amount);
  }
}

class ChargeBankAccountParams {
  int customerId;
  double amount;

  ChargeBankAccountParams(this.customerId, this.amount);
}
