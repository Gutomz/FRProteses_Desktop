import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';
import 'package:frproteses/src/domain/repositories/payment_repository.dart';

class GetPaymentById implements UseCase<PaymentEntity, GetPaymentByIdParams> {
  final IPaymentRepository paymentRepository;

  GetPaymentById(this.paymentRepository);

  @override
  Future<Either<Failure, PaymentEntity>> call(
    GetPaymentByIdParams params,
  ) async {
    return paymentRepository.getById(params.id);
  }
}

class GetPaymentByIdParams {
  int id;

  GetPaymentByIdParams(this.id);
}
