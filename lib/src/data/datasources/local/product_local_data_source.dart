import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/data/models/product_model.dart';

abstract class IProductLocalDataSource {
  /// Create or Update product locally
  ///
  /// Throws a [LocalException] for all error codes.
  Future<ProductModel> setProduct(ProductModel productModel);

  /// Get list of all registered products
  ///
  /// Throws a [LocalException] for all error codes.
  Future<List<ProductModel>> getProductAll();

  /// Find product by id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<ProductModel> getProductById(int id);
}

class ProductLocalDataSourceImpl implements IProductLocalDataSource {
  final File productFile;

  ProductLocalDataSourceImpl({required this.productFile});

  @override
  Future<List<ProductModel>> getProductAll() async {
    try {
      final lines = productFile.readAsLinesSync();
      final products = lines
          .map(
            (line) => ProductModel.fromJson(
              json.decode(line.replaceAll("\n", "")) as Map<String, dynamic>,
            ),
          )
          .toList();

      return products;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    final models = await getProductAll();
    final model = models.firstWhereOrNull((element) => element.id == id);

    if (model == null) {
      throw LocalException();
    }

    return model;
  }

  @override
  Future<ProductModel> setProduct(ProductModel productModel) async {
    final models = await getProductAll();
    final model =
        models.firstWhereOrNull((element) => element.id == productModel.id);

    if (model == null) {
      models.add(productModel);
    } else {
      final index = models.indexOf(model);
      models[index] = productModel;
    }

    final lines = models.map((e) => "${e.toJson().toString()}\n").toList();
    final content = StringBuffer();
    for (final line in lines) {
      content.write(line);
    }

    try {
      productFile.writeAsStringSync(content.toString());
      return productModel;
    } on FileSystemException {
      throw LocalException();
    }
  }
}
