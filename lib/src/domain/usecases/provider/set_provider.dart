import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/domain/repositories/provider_repository.dart';

class SetProvider implements UseCase<ProviderEntity, SetProviderParams> {
  final IProviderRepository providerRepository;

  SetProvider(this.providerRepository);

  @override
  Future<Either<Failure, ProviderEntity>> call(
    SetProviderParams params,
  ) async {
    return providerRepository.set(params.providerEntity);
  }
}

class SetProviderParams {
  ProviderEntity providerEntity;

  SetProviderParams(this.providerEntity);
}
