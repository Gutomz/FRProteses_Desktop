import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/data/datasources/local/provider_local_data_source.dart';
import 'package:frproteses/src/data/models/provider_model.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/domain/repositories/provider_repository.dart';

class ProviderRepositoryImpl implements IProviderRepository {
  final IProviderLocalDataSource localDataSource;

  ProviderRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<ProviderEntity>>> getAll() async {
    try {
      final modelList = await localDataSource.getAll();
      return Right(modelList);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, ProviderEntity>> getById(int id) async {
    try {
      final model = await localDataSource.getById(id);
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, ProviderEntity>> set(
    ProviderEntity providerEntity,
  ) async {
    try {
      final model =
          await localDataSource.set(ProviderModel.copyFrom(providerEntity));
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
}
