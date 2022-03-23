import 'dart:io';

import 'package:collection/collection.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/data/datasources/local/customer_local_data_source.dart';
import 'package:frproteses/src/data/models/payment_model.dart';

abstract class IPaymentLocalDataSource {
  /// Create or Update payment locally
  ///
  /// Throws a [LocalException] for all error codes.
  Future<PaymentModel> set(PaymentModel paymentModel);

  /// Get list of all registered payments
  ///
  /// Throws a [LocalException] for all error codes.
  Future<List<PaymentModel>> getAll();

  /// Find payment by id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<PaymentModel> getById(int id);

  /// Get next id for new payment
  ///
  /// Throws a [LocalException] for all error codes.
  Future<int> getNextId();
}

class PaymentLocalDataSourceImpl implements IPaymentLocalDataSource {
  final File paymentFile;
  final ICustomerLocalDataSource customerLocalDataSource;

  PaymentLocalDataSourceImpl({
    required this.paymentFile,
    required this.customerLocalDataSource,
  });

  @override
  Future<List<PaymentModel>> getAll() async {
    try {
      if (!paymentFile.existsSync()) {
        return List.empty(growable: true);
      }

      final lines = paymentFile.readAsLinesSync();
      final payments = lines
          .map((line) => PaymentModel.fromString(line.replaceAll("\n", "")))
          .toList();

      for (final payment in payments) {
        await _updateCustomerModel(payment);
      }

      return payments;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<PaymentModel> getById(int id) async {
    final models = await getAll();
    final model = models.firstWhereOrNull((element) => element.id == id);

    if (model == null) {
      throw LocalException();
    }

    await _updateCustomerModel(model);

    return model;
  }

  @override
  Future<PaymentModel> set(PaymentModel paymentModel) async {
    final models = await getAll();
    final model =
        models.firstWhereOrNull((element) => element.id == paymentModel.id);

    if (model == null) {
      models.add(paymentModel);
    } else {
      final index = models.indexOf(model);
      models[index] = paymentModel;
    }

    final lines = models.map((e) => e.toString()).toList();
    final content = StringBuffer();
    for (final line in lines) {
      content.write("$line\n");
    }

    try {
      paymentFile.writeAsStringSync(content.toString());
      return paymentModel;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<int> getNextId() async {
    final models = await getAll();

    if (models.isEmpty) {
      return 1;
    }

    return models.last.id + 1;
  }

  Future<void> _updateCustomerModel(PaymentModel payment) async {
    final _customerId = payment.customerEntity.id;
    final _updatedCustomer = await customerLocalDataSource.getById(_customerId);
    payment.customerEntity = _updatedCustomer;
  }
}
