import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/repositories/bank_account_repository.dart';

class ReportBankAccount extends UseCase<void, ReportBankAccountParams> {
  final IBankAccountRepository bankAccountRepository;

  ReportBankAccount(this.bankAccountRepository);

  @override
  Future<Either<Failure, void>> call(ReportBankAccountParams params) {
    return bankAccountRepository.report(params.customerId);
  }
}

class ReportBankAccountParams {
  int customerId;

  ReportBankAccountParams(this.customerId);
}
