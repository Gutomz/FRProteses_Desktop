import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
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

extension StringExtension on String {
  DateTime? toDateTime() {
    final splits = split("/");

    try {
      if (splits.length != 3) throw FormatException();

      final day = int.parse(splits[0]);
      final month = int.parse(splits[1]);
      final year = int.parse(splits[2]);

      return DateTime(year, month, day);
    } on FormatException {
      return null;
    }
  }

  DateTimeRange? toDateTimeRange() {
    final splits = split(" - ");

    try {
      if (splits.length != 2) throw FormatException();

      final start = splits[0].toDateTime();
      final end = splits[1].toDateTime();

      if (start == null || end == null) throw FormatException();

      return DateTimeRange(start: start, end: end);
    } on FormatException {
      return null;
    }
  }
}

extension DateTimeExtension on DateTime {
  String formatDate() {
    return "${day.toString().padLeft(2, "0")}/${month.toString().padLeft(2, "0")}/$year";
  }
}

extension DateTimeRangeExtension on DateTimeRange {
  String formatDate() {
    return "${start.formatDate()} - ${end.formatDate()}";
  }
}

extension ListExtension<E> on List<E> {
  bool exist(bool Function(E) validation) {
    bool found = false;
    for (final e in this) {
      if ((found = validation(e)) == true) {
        break;
      }
    }
    return found;
  }
}

extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right).value as R;
  L asLeft() => (this as Left).value as L;
}
