import 'package:dartz/dartz.dart';

extension IntExtension on int {
  bool toBool() {
    return this == 1;
  }
}

extension BoolExtension on bool? {
  int toInt() {
    return this == true ? 1 : 0;
  }
}

extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right).value as R;
  L asLeft() => (this as Left).value as L;
}
