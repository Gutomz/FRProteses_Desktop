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
  Future<Either<Failure, List<BankAccountEntity>>> getAll() async {
    try {
      final modelList = await localDataSource.getAll();
      return Right(modelList);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, BankAccountEntity>> getById(int id) async {
    try {
      final model = await localDataSource.getById(id);
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, BankAccountEntity>> set(
    BankAccountEntity bankAccountEntity,
  ) async {
    try {
      final model = await localDataSource
          .set(BankAccountModel.copyFrom(bankAccountEntity));
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, BankAccountEntity>> getByCustomerId(
      int customerId) async {
    try {
      final model = await localDataSource.getByCustomerId(customerId);
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, int>> getNextId() async {
    try {
      final id = await localDataSource.getNextId();
      return Right(id);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> charge(int customerId, double amount) async {
    try {
      await localDataSource.charge(customerId, amount);
      return Right(null);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> pay(int customerId, double amount) async {
    try {
      await localDataSource.pay(customerId, amount);
      return Right(null);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> report(int customerId) async {
    try {
      await localDataSource.report(customerId);
      return Right(null);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> clear() async {
    try {
      await localDataSource.clear();
      return Right(null);
    } on LocalException {
      return Left(LocalFailure());
    }
  }
}
