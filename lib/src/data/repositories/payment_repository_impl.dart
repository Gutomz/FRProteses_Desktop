import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/data/datasources/local/payment_local_data_source.dart';
import 'package:frproteses/src/data/models/payment_model.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frproteses/src/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements IPaymentRepository {
  final IPaymentLocalDataSource localDataSource;

  PaymentRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<PaymentEntity>>> getPaymentAll() async {
    try {
      final modelList = await localDataSource.getPaymentAll();
      return Right(modelList);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, PaymentEntity>> getPaymentById(int id) async {
    try {
      final model = await localDataSource.getPaymentById(id);
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, PaymentEntity>> setPayment(
      PaymentEntity paymentEntity) async {
    try {
      final model = await localDataSource
          .setPayment(PaymentModel.copyFrom(paymentEntity));
      return Right(model);
    } on LocalException {
      return Left(LocalFailure());
    }
  }
}
