import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/repositories/customer_repository.dart';

class GetCustomerAll implements UseCase<List<CustomerEntity>, NoParams> {
  final ICustomerRepository customerRepository;

  GetCustomerAll(this.customerRepository);

  @override
  Future<Either<Failure, List<CustomerEntity>>> call(NoParams params) async {
    return await customerRepository.getCustomerAll();
  }
}
