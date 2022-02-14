import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';

abstract class IPaymentRepository {
  Future<Either<Failure, PaymentEntity>> setPayment(
      PaymentEntity paymentEntity);
  Future<Either<Failure, List<PaymentEntity>>> getPaymentAll();
  Future<Either<Failure, PaymentEntity>> getPaymentById(int id);
}
