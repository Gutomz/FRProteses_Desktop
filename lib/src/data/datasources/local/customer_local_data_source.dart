import 'dart:io';

import 'package:collection/collection.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/data/models/customer_model.dart';

abstract class ICustomerLocalDataSource {
  /// Create or Update customer locally
  ///
  /// Throws a [LocalException] for all error codes.
  Future<CustomerModel> set(CustomerModel customerModel);

  /// Find customer by id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<CustomerModel> getById(int id);

  /// Get list of all registered customers
  ///
  /// Throws a [LocalException] for all error codes.
  Future<List<CustomerModel>> getAll();

  /// Get next id for new customer
  ///
  /// Throws a [LocalException] for all error codes.
  Future<int> getNextId();

  /// Check if Customer id exists
  ///
  /// Throws a [LocalException] for all error codes.
  Future<bool> exists(int id);

  /// Clear database
  ///
  /// Throws a [LocalException] for all error codes.
  Future<void> clear();
}

class CustomerLocalDataSourceImpl implements ICustomerLocalDataSource {
  final File customerFile;

  CustomerLocalDataSourceImpl({required this.customerFile});

  @override
  Future<List<CustomerModel>> getAll() async {
    try {
      if (!customerFile.existsSync()) {
        return List.empty(growable: true);
      }

      final lines = customerFile.readAsLinesSync();
      final customers = lines
          .map((line) => CustomerModel.fromString(line.replaceAll("\n", "")))
          .toList();

      return customers;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<CustomerModel> getById(int id) async {
    final models = await getAll();
    final model = models.firstWhereOrNull((element) => element.id == id);

    if (model == null) {
      throw LocalException();
    }

    return model;
  }

  @override
  Future<CustomerModel> set(CustomerModel customerModel) async {
    final models = await getAll();
    final model =
        models.firstWhereOrNull((element) => element.id == customerModel.id);

    if (model == null) {
      models.add(customerModel);
    } else {
      final index = models.indexOf(model);
      models[index] = customerModel;
    }

    final lines = models.map((e) => e.toString()).toList();
    final content = StringBuffer();
    for (final line in lines) {
      content.write("$line\n");
    }

    try {
      customerFile.writeAsStringSync(content.toString());
      return customerModel;
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

  @override
  Future<bool> exists(int id) async {
    try {
      await getById(id);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> clear() async {
    try {
      customerFile.writeAsStringSync("");
    } on FileSystemException {
      throw LocalException();
    }
  }
}
