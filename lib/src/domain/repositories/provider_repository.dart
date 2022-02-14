import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';

abstract class IProviderRepository {
  Future<Either<Failure, ProviderEntity>> setProvider(
      ProviderEntity providerEntity);

  Future<Either<Failure, ProviderEntity>> getProviderById(int id);
  Future<Either<Failure, List<ProviderEntity>>> getProviderAll();
}
