import 'dart:io';

import 'package:collection/collection.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/data/models/product_model.dart';

abstract class IProductLocalDataSource {
  /// Create or Update product locally
  ///
  /// Throws a [LocalException] for all error codes.
  Future<ProductModel> set(ProductModel productModel);

  /// Get list of all registered products
  ///
  /// Throws a [LocalException] for all error codes.
  Future<List<ProductModel>> getAll();

  /// Find product by id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<ProductModel> getById(int id);

  /// Get next id for new product
  ///
  /// Throws a [LocalException] for all error codes.
  Future<int> getNextId();
}

class ProductLocalDataSourceImpl implements IProductLocalDataSource {
  final File productFile;

  ProductLocalDataSourceImpl({required this.productFile});

  @override
  Future<List<ProductModel>> getAll() async {
    try {
      if (!productFile.existsSync()) {
        return List.empty(growable: true);
      }

      final lines = productFile.readAsLinesSync();
      final products = lines
          .map((line) => ProductModel.fromString(line.replaceAll("\n", "")))
          .toList();

      return products;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<ProductModel> getById(int id) async {
    final models = await getAll();
    final model = models.firstWhereOrNull((element) => element.id == id);

    if (model == null) {
      throw LocalException();
    }

    return model;
  }

  @override
  Future<ProductModel> set(ProductModel productModel) async {
    final models = await getAll();
    final model =
        models.firstWhereOrNull((element) => element.id == productModel.id);

    if (model == null) {
      models.add(productModel);
    } else {
      final index = models.indexOf(model);
      models[index] = productModel;
    }

    final lines = models.map((e) => e.toString()).toList();
    final content = StringBuffer();
    for (final line in lines) {
      content.write("$line\n");
    }

    try {
      productFile.writeAsStringSync(content.toString());
      return productModel;
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
}
