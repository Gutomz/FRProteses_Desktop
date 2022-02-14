import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';

abstract class IOrderRepository {
  Future<Either<Failure, OrderEntity>> setOrder(OrderEntity orderEntity);
  Future<Either<Failure, List<OrderEntity>>> getOrderAll();
  Future<Either<Failure, OrderEntity>> getOrderById(int id);
}
