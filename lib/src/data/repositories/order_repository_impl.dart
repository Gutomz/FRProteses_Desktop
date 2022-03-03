import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/data/datasources/local/order_local_data_source.dart';
import 'package:frproteses/src/data/models/order_model.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frproteses/src/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements IOrderRepository {
  final IOrderLocalDataSource localDataSource;

  OrderRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrderAll() async {
    try {
      final modelList = await localDataSource.getOrderAll();
      return Right(modelList);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> getOrderById(int id) async {
    try {
      final model = await localDataSource.getOrderById(id);
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> setOrder(OrderEntity orderEntity) async {
    try {
      final model =
          await localDataSource.setOrder(OrderModel.copyFrom(orderEntity));
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }
}
