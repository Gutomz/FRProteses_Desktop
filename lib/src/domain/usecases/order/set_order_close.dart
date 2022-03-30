import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/domain/repositories/order_repository.dart';

class SetOrderClose extends UseCase<OrderEntity, SetOrderCloseParams> {
  final IOrderRepository orderRepository;

  SetOrderClose(this.orderRepository);

  @override
  Future<Either<Failure, OrderEntity>> call(SetOrderCloseParams params) {
    return orderRepository.setClose(params.id);
  }
}

class SetOrderCloseParams {
  int id;

  SetOrderCloseParams(this.id);
}
