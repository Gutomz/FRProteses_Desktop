import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/repositories/bank_account_repository.dart';

class GetBankAccountNextId extends UseCase<int, NoParams> {
  final IBankAccountRepository bankAccountRepository;

  GetBankAccountNextId(this.bankAccountRepository);

  @override
  Future<Either<Failure, int>> call(NoParams params) {
    return bankAccountRepository.getNextId();
  }
}
