import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';

abstract class IOrderRepository {
  Future<Either<Failure, OrderEntity>> set(OrderEntity orderEntity);
  Future<Either<Failure, List<OrderEntity>>> getAll();
  Future<Either<Failure, OrderEntity>> getById(int id);
  Future<Either<Failure, int>> getNextId();
  Future<Either<Failure, OrderEntity>> setClose(int id);
  Future<Either<Failure, void>> clear();
}
