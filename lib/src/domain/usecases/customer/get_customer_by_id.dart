import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/repositories/customer_repository.dart';

class GetCustomerById
    implements UseCase<CustomerEntity, GetCustomerByIdParams> {
  final ICustomerRepository customerRepository;

  GetCustomerById(this.customerRepository);

  @override
  Future<Either<Failure, CustomerEntity>> call(
    GetCustomerByIdParams params,
  ) async {
    return customerRepository.getCustomerById(params.id);
  }
}

class GetCustomerByIdParams {
  int id;

  GetCustomerByIdParams(this.id);
}
