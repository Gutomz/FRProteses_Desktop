import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

extension NumExtension on num {
  String formatMoney({String symbol = "R\$"}) {
    final NumberFormat numberFormat =
        NumberFormat.simpleCurrency(locale: 'pt_BR', name: symbol);
    return numberFormat.format(this);
  }
}

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
