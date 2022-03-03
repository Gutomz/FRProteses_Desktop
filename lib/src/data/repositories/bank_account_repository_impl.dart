import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/data/datasources/local/bank_account_local_data_source.dart';
import 'package:frproteses/src/data/models/bank_account_model.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';
import 'package:frproteses/src/domain/repositories/bank_account_repository.dart';

class BankAccountRepositoryImpl implements IBankAccountRepository {
  final IBankAccountLocalDataSource localDataSource;

  BankAccountRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<BankAccountEntity>>> getBankAccountAll() async {
    try {
      final modelList = await localDataSource.getBankAccountAll();
      return Right(modelList);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, BankAccountEntity>> getBankAccountById(int id) async {
    try {
      final model = await localDataSource.getBankAccountById(id);
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, BankAccountEntity>> setBankAccount(
    BankAccountEntity bankAccountEntity,
  ) async {
    try {
      final model = await localDataSource
          .setBankAccount(BankAccountModel.copyFrom(bankAccountEntity));
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }
}
