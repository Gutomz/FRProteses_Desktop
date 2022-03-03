import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/data/datasources/local/customer_local_data_source.dart';
import 'package:frproteses/src/data/models/customer_model.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements ICustomerRepository {
  final ICustomerLocalDataSource localDataSource;

  CustomerRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<CustomerEntity>>> getCustomerAll() async {
    try {
      final modelList = await localDataSource.getCustomerAll();
      return Right(modelList);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, CustomerEntity>> getCustomerById(int id) async {
    try {
      final model = await localDataSource.getCustomerById(id);
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, CustomerEntity>> setCustomer(
    CustomerEntity customerEntity,
  ) async {
    try {
      final model = await localDataSource
          .setCustomer(CustomerModel.copyFrom(customerEntity));
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }
}
