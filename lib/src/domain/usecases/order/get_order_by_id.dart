import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/domain/repositories/order_repository.dart';

class GetOrderById implements UseCase<OrderEntity, GetOrderByIdParams> {
  final IOrderRepository orderRepository;

  GetOrderById(this.orderRepository);

  @override
  Future<Either<Failure, OrderEntity>> call(GetOrderByIdParams params) async {
    return await orderRepository.getOrderById(params.id);
  }
}

class GetOrderByIdParams {
  int id;

  GetOrderByIdParams(this.id);
}
