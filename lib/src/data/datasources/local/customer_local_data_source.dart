import 'dart:convert';
import 'dart:io';

import 'package:frproteses/src/core/errors/exception.dart';
import 'package:collection/collection.dart';
import 'package:frproteses/src/data/models/customer_model.dart';

abstract class ICustomerLocalDataSource {
  /// Create or Update customer locally
  ///
  /// Throws a [LocalException] for all error codes.
  Future<CustomerModel> setCustomer(CustomerModel customerModel);

  /// Find customer by id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<CustomerModel> getCustomerById(int id);

  /// Get list of all registered customers
  ///
  /// Throws a [LocalException] for all error codes.
  Future<List<CustomerModel>> getCustomerAll();
}

class CustomerLocalDataSourceImpl implements ICustomerLocalDataSource {
  final File customerFile;

  CustomerLocalDataSourceImpl({required this.customerFile});

  @override
  Future<List<CustomerModel>> getCustomerAll() async {
    try {
      final lines = customerFile.readAsLinesSync();
      List<CustomerModel> customers = lines
          .map((line) =>
              CustomerModel.fromJson(json.decode(line.replaceAll("\n", ""))))
          .toList();

      return customers;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<CustomerModel> getCustomerById(int id) async {
    final models = await getCustomerAll();
    final model = models.firstWhereOrNull((element) => element.id == id);

    if (model == null) {
      throw LocalException();
    }

    return model;
  }

  @override
  Future<CustomerModel> setCustomer(CustomerModel customerModel) async {
    final models = await getCustomerAll();
    final model =
        models.firstWhereOrNull((element) => element.id == customerModel.id);

    if (model == null) {
      models.add(customerModel);
    } else {
      final index = models.indexOf(model);
      models[index] = customerModel;
    }

    final lines = models.map((e) => e.toJson().toString() + "\n").toList();
    String content = "";
    for (final line in lines) {
      content += line;
    }

    try {
      customerFile.writeAsStringSync(content);
      return customerModel;
    } on FileSystemException {
      throw LocalException();
    }
  }
}
