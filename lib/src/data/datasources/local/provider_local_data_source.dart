import 'dart:io';

import 'package:collection/collection.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/data/models/provider_model.dart';

abstract class IProviderLocalDataSource {
  /// Create or Update provider locally
  ///
  /// Throws a [LocalException] for all error codes.
  Future<ProviderModel> set(ProviderModel providerModel);

  /// Find provider by id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<ProviderModel> getById(int id);

  /// Get list of all registered providers
  ///
  /// Throws a [LocalException] for all error codes.
  Future<List<ProviderModel>> getAll();

  /// Get next id for new provider
  ///
  /// Throws a [LocalException] for all error codes.
  Future<int> getNextId();

  /// Clear database
  ///
  /// Throws a [LocalException] for all error codes.
  Future<void> clear();
}

class ProviderLocalDataSourceImpl implements IProviderLocalDataSource {
  final File providerFile;

  ProviderLocalDataSourceImpl({required this.providerFile});

  @override
  Future<List<ProviderModel>> getAll() async {
    try {
      if (!providerFile.existsSync()) {
        return List.empty(growable: true);
      }

      final lines = providerFile.readAsLinesSync();
      final providers = lines
          .map((line) => ProviderModel.fromString(line.replaceAll("\n", "")))
          .toList();

      return providers;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<ProviderModel> getById(int id) async {
    final models = await getAll();
    final model = models.firstWhereOrNull((element) => element.id == id);

    if (model == null) {
      throw LocalException();
    }

    return model;
  }

  @override
  Future<ProviderModel> set(ProviderModel providerModel) async {
    final models = await getAll();
    final model =
        models.firstWhereOrNull((element) => element.id == providerModel.id);

    if (model == null) {
      models.add(providerModel);
    } else {
      final index = models.indexOf(model);
      models[index] = providerModel;
    }

    final lines = models.map((e) => e.toString()).toList();
    final content = StringBuffer();
    for (final line in lines) {
      content.write("$line\n");
    }

    try {
      providerFile.writeAsStringSync(content.toString());
      return providerModel;
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
  Future<void> clear() async {
    try {
      providerFile.writeAsStringSync("");
    } on FileSystemException {
      throw LocalException();
    }
  }
}
