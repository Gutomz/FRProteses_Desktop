import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';

abstract class IBankAccountRepository {
  Future<Either<Failure, BankAccountEntity>> set(
    BankAccountEntity bankAccountEntity,
  );
  Future<Either<Failure, List<BankAccountEntity>>> getAll();
  Future<Either<Failure, BankAccountEntity>> getById(int id);
  Future<Either<Failure, BankAccountEntity>> getByCustomerId(int customerId);
  Future<Either<Failure, int>> getNextId();
  Future<Either<Failure, void>> pay(int customerId, double amount);
  Future<Either<Failure, void>> charge(int customerId, double amount);
  Future<Either<Failure, void>> report(int customerId);
  Future<Either<Failure, void>> clear();
}
