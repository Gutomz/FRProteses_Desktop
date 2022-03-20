import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/repositories/provider_repository.dart';

class GetProviderNextId implements UseCase<int, NoParams> {
  final IProviderRepository providerRepository;

  GetProviderNextId(this.providerRepository);

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return providerRepository.getNextId();
  }
}
