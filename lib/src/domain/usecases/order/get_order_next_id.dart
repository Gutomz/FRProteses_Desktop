import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/repositories/order_repository.dart';

class GetOrderNextId extends UseCase<int, NoParams> {
  final IOrderRepository orderRepository;

  GetOrderNextId(this.orderRepository);

  @override
  Future<Either<Failure, int>> call(NoParams noParams) {
    return orderRepository.getNextId();
  }
}
