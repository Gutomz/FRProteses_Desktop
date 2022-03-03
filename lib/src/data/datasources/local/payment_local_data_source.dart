import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/data/models/payment_model.dart';

abstract class IPaymentLocalDataSource {
  /// Create or Update payment locally
  ///
  /// Throws a [LocalException] for all error codes.
  Future<PaymentModel> setPayment(PaymentModel paymentModel);

  /// Get list of all registered payments
  ///
  /// Throws a [LocalException] for all error codes.
  Future<List<PaymentModel>> getPaymentAll();

  /// Find payment by id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<PaymentModel> getPaymentById(int id);
}

class PaymentLocalDataSourceImpl implements IPaymentLocalDataSource {
  final File paymentFile;

  PaymentLocalDataSourceImpl({required this.paymentFile});

  @override
  Future<List<PaymentModel>> getPaymentAll() async {
    try {
      final lines = paymentFile.readAsLinesSync();
      final payments = lines
          .map(
            (line) => PaymentModel.fromJson(
              json.decode(line.replaceAll("\n", "")) as Map<String, dynamic>,
            ),
          )
          .toList();

      return payments;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<PaymentModel> getPaymentById(int id) async {
    final models = await getPaymentAll();
    final model = models.firstWhereOrNull((element) => element.id == id);

    if (model == null) {
      throw LocalException();
    }

    return model;
  }

  @override
  Future<PaymentModel> setPayment(PaymentModel paymentModel) async {
    final models = await getPaymentAll();
    final model =
        models.firstWhereOrNull((element) => element.id == paymentModel.id);

    if (model == null) {
      models.add(paymentModel);
    } else {
      final index = models.indexOf(model);
      models[index] = paymentModel;
    }

    final lines = models.map((e) => "${e.toJson().toString()}\n").toList();
    final content = StringBuffer();
    for (final line in lines) {
      content.write(line);
    }

    try {
      paymentFile.writeAsStringSync(content.toString());
      return paymentModel;
    } on FileSystemException {
      throw LocalException();
    }
  }
}
