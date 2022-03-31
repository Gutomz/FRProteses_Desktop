import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';
import 'package:frproteses/src/domain/repositories/bank_account_repository.dart';

class GetBankAccountAll implements UseCase<List<BankAccountEntity>, NoParams> {
  final IBankAccountRepository bankAccountRepository;

  GetBankAccountAll(this.bankAccountRepository);

  @override
  Future<Either<Failure, List<BankAccountEntity>>> call(NoParams params) async {
    return bankAccountRepository.getAll();
  }
}
