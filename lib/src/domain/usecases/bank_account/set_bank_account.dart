import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';
import 'package:frproteses/src/domain/repositories/bank_account_repository.dart';

class SetBankAccount
    implements UseCase<BankAccountEntity, SetBankAccountParams> {
  final IBankAccountRepository bankAccountRepository;

  SetBankAccount(this.bankAccountRepository);

  @override
  Future<Either<Failure, BankAccountEntity>> call(
    SetBankAccountParams params,
  ) async {
    return bankAccountRepository.setBankAccount(params.bankAccountEntity);
  }
}

class SetBankAccountParams {
  BankAccountEntity bankAccountEntity;

  SetBankAccountParams(this.bankAccountEntity);
}
