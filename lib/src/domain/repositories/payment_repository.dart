import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';

abstract class IPaymentRepository {
  Future<Either<Failure, PaymentEntity>> set(
    PaymentEntity paymentEntity,
  );
  Future<Either<Failure, List<PaymentEntity>>> getAll();
  Future<Either<Failure, PaymentEntity>> getById(int id);
  Future<Either<Failure, int>> getNextId();
  Future<Either<Failure, void>> clear();
}
