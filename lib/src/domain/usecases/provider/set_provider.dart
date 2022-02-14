import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/domain/repositories/provider_repository.dart';

class SetProvider {
  final IProviderRepository providerRepository;

  SetProvider(this.providerRepository);

  Future<Either<Failure, ProviderEntity>> call(
      ProviderEntity providerEntity) async {
    return await providerRepository.setProvider(providerEntity);
  }
}
