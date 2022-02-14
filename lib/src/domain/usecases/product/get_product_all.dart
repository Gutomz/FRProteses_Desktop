import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/domain/repositories/product_repository.dart';

class GetProductAll implements UseCase<List<ProductEntity>, NoParams> {
  final IProductRepository productRepository;

  GetProductAll(this.productRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await productRepository.getProductAll();
  }
}
