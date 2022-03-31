import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';
import 'package:frproteses/src/domain/repositories/bank_account_repository.dart';

class GetBankAccountByCustomerId
    implements UseCase<BankAccountEntity, GetBankAccountByCustomerIdParams> {
  final IBankAccountRepository bankAccountRepository;

  GetBankAccountByCustomerId(this.bankAccountRepository);

  @override
  Future<Either<Failure, BankAccountEntity>> call(
    GetBankAccountByCustomerIdParams params,
  ) async {
    return bankAccountRepository.getByCustomerId(params.customerId);
  }
}

class GetBankAccountByCustomerIdParams {
  int customerId;

  GetBankAccountByCustomerIdParams(this.customerId);
}
