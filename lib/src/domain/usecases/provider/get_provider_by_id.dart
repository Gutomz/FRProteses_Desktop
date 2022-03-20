import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/domain/repositories/provider_repository.dart';

class GetProviderById
    implements UseCase<ProviderEntity, GetProviderByIdParams> {
  final IProviderRepository providerRepository;

  GetProviderById(this.providerRepository);

  @override
  Future<Either<Failure, ProviderEntity>> call(
    GetProviderByIdParams params,
  ) async {
    return providerRepository.getById(params.id);
  }
}

class GetProviderByIdParams {
  int id;

  GetProviderByIdParams(this.id);
}
