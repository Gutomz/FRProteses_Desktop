import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/repositories/customer_repository.dart';

class SetCustomer implements UseCase<CustomerEntity, SetCustomerParams> {
  final ICustomerRepository customerRepository;

  SetCustomer(this.customerRepository);

  @override
  Future<Either<Failure, CustomerEntity>> call(SetCustomerParams params) async {
    return customerRepository.set(params.customerEntity);
  }
}

class SetCustomerParams {
  CustomerEntity customerEntity;

  SetCustomerParams(this.customerEntity);
}
