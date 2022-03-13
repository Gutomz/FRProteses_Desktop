import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';

abstract class ICustomerRepository {
  Future<Either<Failure, CustomerEntity>> set(CustomerEntity customerEntity);
  Future<Either<Failure, CustomerEntity>> getById(int id);
  Future<Either<Failure, List<CustomerEntity>>> getAll();
  Future<Either<Failure, int>> getNextId();
}
