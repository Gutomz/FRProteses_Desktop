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
  Future<Either<Failure, List<ProviderEntity>>> getProviderAll() async {
    try {
      final modelList = await localDataSource.getProviderAll();
      return Right(modelList);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, ProviderEntity>> getProviderById(int id) async {
    try {
      final model = await localDataSource.getProviderById(id);
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, ProviderEntity>> setProvider(
    ProviderEntity providerEntity,
  ) async {
    try {
      final model = await localDataSource
          .setProvider(ProviderModel.copyFrom(providerEntity));
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }
}
