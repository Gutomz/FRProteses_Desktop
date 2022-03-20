import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/domain/repositories/provider_repository.dart';

class GetProviderAll implements UseCase<List<ProviderEntity>, NoParams> {
  final IProviderRepository providerRepository;

  GetProviderAll(this.providerRepository);

  @override
  Future<Either<Failure, List<ProviderEntity>>> call(NoParams params) async {
    return providerRepository.getAll();
  }
}
