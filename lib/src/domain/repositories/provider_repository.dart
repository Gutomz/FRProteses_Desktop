import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';

abstract class IProviderRepository {
  Future<Either<Failure, ProviderEntity>> set(
    ProviderEntity providerEntity,
  );
  Future<Either<Failure, ProviderEntity>> getById(int id);
  Future<Either<Failure, List<ProviderEntity>>> getAll();
  Future<Either<Failure, int>> getNextId();
  Future<Either<Failure, void>> clear();
}
