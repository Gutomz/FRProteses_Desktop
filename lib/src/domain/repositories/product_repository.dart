import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';

abstract class IProductRepository {
  Future<Either<Failure, ProductEntity>> set(
    ProductEntity productEntity,
  );
  Future<Either<Failure, List<ProductEntity>>> getAll();
  Future<Either<Failure, ProductEntity>> getById(int id);
  Future<Either<Failure, int>> getNextId();
}
