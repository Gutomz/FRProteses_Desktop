import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/domain/repositories/order_repository.dart';

class GetOrderAll implements UseCase<List<OrderEntity>, NoParams> {
  final IOrderRepository orderRepository;

  GetOrderAll(this.orderRepository);

  @override
  Future<Either<Failure, List<OrderEntity>>> call(NoParams params) async {
    return orderRepository.getOrderAll();
  }
}
