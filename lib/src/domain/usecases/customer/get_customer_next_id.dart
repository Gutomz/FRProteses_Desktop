import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/repositories/customer_repository.dart';

class GetCustomerNextId implements UseCase<int, NoParams> {
  final ICustomerRepository customerRepository;

  GetCustomerNextId(this.customerRepository);

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return customerRepository.getNextId();
  }
}
