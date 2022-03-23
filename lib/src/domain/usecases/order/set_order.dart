import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/domain/repositories/order_repository.dart';

class SetOrder implements UseCase<OrderEntity, SetOrderParams> {
  final IOrderRepository orderRepository;

  SetOrder(this.orderRepository);

  @override
  Future<Either<Failure, OrderEntity>> call(SetOrderParams params) async {
    return orderRepository.set(params.orderEntity);
  }
}

class SetOrderParams {
  OrderEntity orderEntity;

  SetOrderParams(this.orderEntity);
}
