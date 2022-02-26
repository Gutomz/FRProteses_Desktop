import 'dart:convert';
import 'dart:io';

import 'package:frproteses/src/core/errors/exception.dart';
import 'package:collection/collection.dart';
import 'package:frproteses/src/data/models/order_model.dart';

abstract class IOrderLocalDataSource {
  /// Create or Update order locally
  ///
  /// Throws a [LocalException] for all error codes.
  Future<OrderModel> setOrder(OrderModel orderModel);

  /// Get list of all registered orders
  ///
  /// Throws a [LocalException] for all error codes.
  Future<List<OrderModel>> getOrderAll();

  /// Find order by id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<OrderModel> getOrderById(int id);
}

class OrderLocalDataSourceImpl implements IOrderLocalDataSource {
  final File orderFile;

  OrderLocalDataSourceImpl({required this.orderFile});

  @override
  Future<List<OrderModel>> getOrderAll() async {
    try {
      final lines = orderFile.readAsLinesSync();
      List<OrderModel> orders = lines
          .map((line) =>
              OrderModel.fromJson(json.decode(line.replaceAll("\n", ""))))
          .toList();

      return orders;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<OrderModel> getOrderById(int id) async {
    final models = await getOrderAll();
    final model = models.firstWhereOrNull((element) => element.id == id);

    if (model == null) {
      throw LocalException();
    }

    return model;
  }

  @override
  Future<OrderModel> setOrder(OrderModel orderModel) async {
    final models = await getOrderAll();
    final model =
        models.firstWhereOrNull((element) => element.id == orderModel.id);

    if (model == null) {
      models.add(orderModel);
    } else {
      final index = models.indexOf(model);
      models[index] = orderModel;
    }

    final lines = models.map((e) => e.toJson().toString() + "\n").toList();
    String content = "";
    for (final line in lines) {
      content += line;
    }

    try {
      orderFile.writeAsStringSync(content);
      return orderModel;
    } on FileSystemException {
      throw LocalException();
    }
  }
}
