import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/data/datasources/local/product_local_data_source.dart';
import 'package:frproteses/src/data/models/product_model.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements IProductRepository {
  final IProductLocalDataSource localDataSource;

  ProductRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getAll() async {
    try {
      final modelList = await localDataSource.getAll();
      return Right(modelList);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getById(int id) async {
    try {
      final model = await localDataSource.getById(id);
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> set(
    ProductEntity productEntity,
  ) async {
    try {
      final model =
          await localDataSource.set(ProductModel.copyFrom(productEntity));
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, int>> getNextId() async {
    try {
      final id = await localDataSource.getNextId();
      return Right(id);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> clear() async {
    try {
      await localDataSource.clear();
      return Right(null);
    } on LocalException {
      return Left(LocalFailure());
    }
  }
}
