import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/domain/repositories/provider_repository.dart';

class GetProviderAll {
  final IProviderRepository providerRepository;

  GetProviderAll(this.providerRepository);

  Future<Either<Failure, List<ProviderEntity>>> call() async {
    return await providerRepository.getProviderAll();
  }
}
