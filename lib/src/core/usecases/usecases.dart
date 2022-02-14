import 'package:dartz/dartz.dart';
import 'package:frproteses/src/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
