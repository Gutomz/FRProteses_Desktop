import 'dart:io';

import 'package:collection/collection.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/data/datasources/local/customer_local_data_source.dart';
import 'package:frproteses/src/data/models/bank_account_model.dart';

abstract class IBankAccountLocalDataSource {
  /// Create or Update bank account locally
  ///
  /// Throws a [LocalException] for all error codes.
  Future<BankAccountModel> set(BankAccountModel bankAccountModel);

  /// Get list of all registered bank accounts
  ///
  /// Throws a [LocalException] for all error codes.
  Future<List<BankAccountModel>> getAll();

  /// Find bank account by id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<BankAccountModel> getById(int id);

  /// Find bank account by Customer id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<BankAccountModel> getByCustomerId(int customerId);

  /// Get next id for new bank account
  ///
  /// Throws a [LocalException] for all error codes.
  Future<int> getNextId();

  /// Pay [amount] value for bank account with [customerId]
  ///
  /// Throws a [LocalException] for all error codes.
  Future<void> pay(int customerId, double amount);

  /// Charge [amount] value for bank account with [customerId]
  ///
  /// Throws a [LocalException] for all error codes.
  Future<void> charge(int customerId, double amount);

  /// Report [customerId] bank account
  ///
  /// Throws a [LocalException] for all error codes.
  Future<void> report(int customerId);

  /// Clear database
  ///
  /// Throws a [LocalException] for all error codes.
  Future<void> clear();
}

class BankAccountLocalDataSourceImpl implements IBankAccountLocalDataSource {
  final File bankAccountFile;
  final ICustomerLocalDataSource customerLocalDataSource;

  BankAccountLocalDataSourceImpl({
    required this.bankAccountFile,
    required this.customerLocalDataSource,
  });

  @override
  Future<List<BankAccountModel>> getAll() async {
    try {
      if (!bankAccountFile.existsSync()) {
        return List.empty(growable: true);
      }

      final lines = bankAccountFile.readAsLinesSync();
      final bankAccounts = lines
          .map((line) => BankAccountModel.fromString(line.replaceAll("\n", "")))
          .toList();

      for (final bankAccount in bankAccounts) {
        _updateCustomerModel(bankAccount);
      }

      return bankAccounts;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<BankAccountModel> getById(int id) async {
    final models = await getAll();
    final model = models.firstWhereOrNull((element) => element.id == id);

    if (model == null) {
      throw LocalException();
    }

    return model;
  }

  @override
  Future<BankAccountModel> set(
    BankAccountModel bankAccountModel,
  ) async {
    final models = await getAll();
    final model =
        models.firstWhereOrNull((element) => element.id == bankAccountModel.id);

    if (model == null) {
      models.add(bankAccountModel);
    } else {
      final index = models.indexOf(model);
      models[index] = bankAccountModel;
    }

    final lines = models.map((e) => e.toString()).toList();
    final content = StringBuffer();
    for (final line in lines) {
      content.write("$line\n");
    }

    try {
      bankAccountFile.writeAsStringSync(content.toString());
      return bankAccountModel;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<BankAccountModel> getByCustomerId(int customerId) async {
    final models = await getAll();
    BankAccountModel? model =
        models.firstWhereOrNull((e) => e.customerEntity.id == customerId);

    if (model == null) {
      if (await customerLocalDataSource.exists(customerId)) {
        model = BankAccountModel.empty(
          id: await getNextId(),
          customerModel: await customerLocalDataSource.getById(customerId),
        );
      } else {
        throw LocalException();
      }
    }

    return model;
  }

  @override
  Future<int> getNextId() async {
    final models = await getAll();

    if (models.isEmpty) {
      return 1;
    }

    return models.last.id + 1;
  }

  Future<void> _updateCustomerModel(BankAccountModel bankAccountModel) async {
    final _customerId = bankAccountModel.customerEntity.id;
    final _updatedCustomer = await customerLocalDataSource.getById(_customerId);
    bankAccountModel.customerEntity = _updatedCustomer;
  }

  @override
  Future<void> pay(int customerId, double amount) async {
    final model = await getByCustomerId(customerId);
    model.balance += amount;
    model.paymentsTotalValue += amount;
    model.paymentsCount++;
    await set(model);
  }

  @override
  Future<void> charge(int customerId, double amount) async {
    final model = await getByCustomerId(customerId);
    model.outstandingBalance += amount;
    model.ordersTotalValue += amount;
    model.ordersCount++;
    await set(model);
  }

  @override
  Future<void> report(int customerId) async {
    final model = await getByCustomerId(customerId);
    model.balance -= model.outstandingBalance;
    model.outstandingBalance = 0;
    await set(model);
  }

  @override
  Future<void> clear() async {
    try {
      bankAccountFile.writeAsStringSync("");
    } on FileSystemException {
      throw LocalException();
    }
  }
}
