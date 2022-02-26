import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/data/datasources/local/product_local_data_source.dart';
import 'package:frproteses/src/data/models/product_model.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frproteses/src/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements IProductRepository {
  final IProductLocalDataSource localDataSource;

  ProductRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductAll() async {
    try {
      final modelList = await localDataSource.getProductAll();
      return Right(modelList);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int id) async {
    try {
      final model = await localDataSource.getProductById(id);
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> setProduct(
      ProductEntity productEntity) async {
    try {
      final model = await localDataSource
          .setProduct(ProductModel.copyFrom(productEntity));
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }
}
