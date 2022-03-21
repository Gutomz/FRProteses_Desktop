import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/domain/repositories/product_repository.dart';

class SetProduct implements UseCase<ProductEntity, SetProductParams> {
  final IProductRepository productRepository;

  SetProduct(this.productRepository);

  @override
  Future<Either<Failure, ProductEntity>> call(SetProductParams params) async {
    return productRepository.set(params.productEntity);
  }
}

class SetProductParams {
  ProductEntity productEntity;

  SetProductParams(this.productEntity);
}
