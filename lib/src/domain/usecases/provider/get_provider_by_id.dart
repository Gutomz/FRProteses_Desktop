import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/domain/repositories/provider_repository.dart';

class GetProviderById {
  final IProviderRepository providerRepository;

  GetProviderById(this.providerRepository);

  Future<Either<Failure, ProviderEntity>> call(int id) async {
    return await providerRepository.getProviderById(id);
  }
}
