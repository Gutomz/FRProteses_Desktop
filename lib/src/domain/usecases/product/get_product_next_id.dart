import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/repositories/product_repository.dart';

class GetProductNextId implements UseCase<int, NoParams> {
  final IProductRepository productRepository;

  GetProductNextId(this.productRepository);

  @override
  Future<Either<Failure, int>> call(NoParams params) {
    return productRepository.getNextId();
  }
}
