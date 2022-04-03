import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/data/datasources/local/order_local_data_source.dart';
import 'package:frproteses/src/data/models/order_model.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements IOrderRepository {
  final IOrderLocalDataSource localDataSource;

  OrderRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> getAll() async {
    try {
      final modelList = await localDataSource.getAll();
      return Right(modelList);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> getById(int id) async {
    try {
      final model = await localDataSource.getById(id);
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> set(OrderEntity orderEntity) async {
    try {
      final model = await localDataSource.set(OrderModel.copyFrom(orderEntity));
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
  Future<Either<Failure, OrderEntity>> setClose(int id) async {
    try {
      final model = await localDataSource.setClose(id);
      return Right(model);
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
