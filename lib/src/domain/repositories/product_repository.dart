import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';

abstract class IProductRepository {
  Future<Either<Failure, ProductEntity>> setProduct(
      ProductEntity productEntity);
  Future<Either<Failure, List<ProductEntity>>> getProductAll();
  Future<Either<Failure, ProductEntity>> getProductById(int id);
}
