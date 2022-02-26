import 'dart:convert';
import 'dart:io';

import 'package:frproteses/src/core/errors/exception.dart';
import 'package:collection/collection.dart';
import 'package:frproteses/src/data/models/bank_account_model.dart';

abstract class IBankAccountLocalDataSource {
  /// Create or Update bank account locally
  ///
  /// Throws a [LocalException] for all error codes.
  Future<BankAccountModel> setBankAccount(BankAccountModel bankAccountModel);

  /// Get list of all registered bank accounts
  ///
  /// Throws a [LocalException] for all error codes.
  Future<List<BankAccountModel>> getBankAccountAll();

  /// Find bank account by id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<BankAccountModel> getBankAccountById(int id);
}

class BankAccountLocalDataSourceImpl implements IBankAccountLocalDataSource {
  final File bankAccountFile;

  BankAccountLocalDataSourceImpl({required this.bankAccountFile});

  @override
  Future<List<BankAccountModel>> getBankAccountAll() async {
    try {
      final lines = bankAccountFile.readAsLinesSync();
      List<BankAccountModel> bankAccounts = lines
          .map((line) =>
              BankAccountModel.fromJson(json.decode(line.replaceAll("\n", ""))))
          .toList();

      return bankAccounts;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<BankAccountModel> getBankAccountById(int id) async {
    final models = await getBankAccountAll();
    final model = models.firstWhereOrNull((element) => element.id == id);

    if (model == null) {
      throw LocalException();
    }

    return model;
  }

  @override
  Future<BankAccountModel> setBankAccount(
      BankAccountModel bankAccountModel) async {
    final models = await getBankAccountAll();
    final model =
        models.firstWhereOrNull((element) => element.id == bankAccountModel.id);

    if (model == null) {
      models.add(bankAccountModel);
    } else {
      final index = models.indexOf(model);
      models[index] = bankAccountModel;
    }

    final lines = models.map((e) => e.toJson().toString() + "\n").toList();
    String content = "";
    for (final line in lines) {
      content += line;
    }

    try {
      bankAccountFile.writeAsStringSync(content);
      return bankAccountModel;
    } on FileSystemException {
      throw LocalException();
    }
  }
}
