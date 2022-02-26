import 'dart:convert';
import 'dart:io';

import 'package:frproteses/src/core/errors/exception.dart';
import 'package:collection/collection.dart';
import 'package:frproteses/src/data/models/provider_model.dart';

abstract class IProviderLocalDataSource {
  /// Create or Update provider locally
  ///
  /// Throws a [LocalException] for all error codes.
  Future<ProviderModel> setProvider(ProviderModel providerModel);

  /// Find provider by id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<ProviderModel> getProviderById(int id);

  /// Get list of all registered providers
  ///
  /// Throws a [LocalException] for all error codes.
  Future<List<ProviderModel>> getProviderAll();
}

class ProviderLocalDataSourceImpl implements IProviderLocalDataSource {
  final File providerFile;

  ProviderLocalDataSourceImpl({required this.providerFile});

  @override
  Future<List<ProviderModel>> getProviderAll() async {
    try {
      final lines = providerFile.readAsLinesSync();
      List<ProviderModel> providers = lines
          .map((line) =>
              ProviderModel.fromJson(json.decode(line.replaceAll("\n", ""))))
          .toList();

      return providers;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<ProviderModel> getProviderById(int id) async {
    final models = await getProviderAll();
    final model = models.firstWhereOrNull((element) => element.id == id);

    if (model == null) {
      throw LocalException();
    }

    return model;
  }

  @override
  Future<ProviderModel> setProvider(ProviderModel providerModel) async {
    final models = await getProviderAll();
    final model =
        models.firstWhereOrNull((element) => element.id == providerModel.id);

    if (model == null) {
      models.add(providerModel);
    } else {
      final index = models.indexOf(model);
      models[index] = providerModel;
    }

    final lines = models.map((e) => e.toJson().toString() + "\n").toList();
    String content = "";
    for (final line in lines) {
      content += line;
    }

    try {
      providerFile.writeAsStringSync(content);
      return providerModel;
    } on FileSystemException {
      throw LocalException();
    }
  }
}
