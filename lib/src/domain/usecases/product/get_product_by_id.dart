import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/domain/repositories/product_repository.dart';

class GetProductById implements UseCase<ProductEntity, GetProductByIdParams> {
  final IProductRepository productRepository;

  GetProductById(this.productRepository);

  @override
  Future<Either<Failure, ProductEntity>> call(
      GetProductByIdParams params) async {
    return await productRepository.getProductById(params.id);
  }
}

class GetProductByIdParams {
  int id;

  GetProductByIdParams(this.id);
}
