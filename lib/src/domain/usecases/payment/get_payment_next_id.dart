import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/domain/repositories/payment_repository.dart';

class GetPaymentNextId implements UseCase<int, NoParams> {
  final IPaymentRepository paymentRepository;

  GetPaymentNextId(this.paymentRepository);

  @override
  Future<Either<Failure, int>> call(NoParams params) {
    return paymentRepository.getNextId();
  }
}
