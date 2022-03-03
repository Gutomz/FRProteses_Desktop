import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';
import 'package:frproteses/src/domain/repositories/payment_repository.dart';

class SetPayment implements UseCase<PaymentEntity, SetPaymentParams> {
  final IPaymentRepository paymentRepository;

  SetPayment(this.paymentRepository);

  @override
  Future<Either<Failure, PaymentEntity>> call(SetPaymentParams params) async {
    return paymentRepository.setPayment(params.paymentEntity);
  }
}

class SetPaymentParams {
  PaymentEntity paymentEntity;

  SetPaymentParams(this.paymentEntity);
}
