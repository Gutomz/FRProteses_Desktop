import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';
import 'package:frproteses/src/domain/repositories/bank_account_repository.dart';

class GetBankAccountById
    implements UseCase<BankAccountEntity, GetBankAccountByIdParams> {
  final IBankAccountRepository bankAccountRepository;

  GetBankAccountById(this.bankAccountRepository);

  @override
  Future<Either<Failure, BankAccountEntity>> call(
    GetBankAccountByIdParams params,
  ) async {
    return bankAccountRepository.getBankAccountById(params.id);
  }
}

class GetBankAccountByIdParams {
  int id;

  GetBankAccountByIdParams(this.id);
}
