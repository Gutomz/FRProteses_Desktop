import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/repositories/bank_account_repository.dart';
import 'package:frproteses/src/domain/repositories/customer_repository.dart';
import 'package:frproteses/src/domain/repositories/order_repository.dart';
import 'package:frproteses/src/domain/repositories/payment_repository.dart';
import 'package:frproteses/src/domain/repositories/product_repository.dart';
import 'package:frproteses/src/domain/repositories/provider_repository.dart';

class ClearDatabase extends UseCase<void, NoParams> {
  final IBankAccountRepository bankAccountRepository;
  final ICustomerRepository customerRepository;
  final IOrderRepository orderRepository;
  final IPaymentRepository paymentRepository;
  final IProductRepository productRepository;
  final IProviderRepository providerRepository;

  ClearDatabase({
    required this.bankAccountRepository,
    required this.customerRepository,
    required this.orderRepository,
    required this.paymentRepository,
    required this.productRepository,
    required this.providerRepository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    Either<Failure, void> result = await bankAccountRepository.clear();
    if (result.isLeft()) {
      return Left(result.asLeft());
    }

    result = await customerRepository.clear();
    if (result.isLeft()) {
      return Left(result.asLeft());
    }

    result = await orderRepository.clear();
    if (result.isLeft()) {
      return Left(result.asLeft());
    }

    result = await paymentRepository.clear();
    if (result.isLeft()) {
      return Left(result.asLeft());
    }

    result = await productRepository.clear();
    if (result.isLeft()) {
      return Left(result.asLeft());
    }

    result = await providerRepository.clear();
    if (result.isLeft()) {
      return Left(result.asLeft());
    }

    return Right(null);
  }
}
