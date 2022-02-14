import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';
import 'package:frproteses/src/domain/repositories/payment_repository.dart';

class GetPaymentAll implements UseCase<List<PaymentEntity>, NoParams> {
  final IPaymentRepository paymentRepository;

  GetPaymentAll(this.paymentRepository);

  @override
  Future<Either<Failure, List<PaymentEntity>>> call(NoParams params) async {
    return await paymentRepository.getPaymentAll();
  }
}
