import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';

abstract class IBankAccountRepository {
  Future<Either<Failure, BankAccountEntity>> setBankAccount(
      BankAccountEntity bankAccountEntity);
  Future<Either<Failure, List<BankAccountEntity>>> getBankAccountAll();
  Future<Either<Failure, BankAccountEntity>> getBankAccountById(int id);
}
