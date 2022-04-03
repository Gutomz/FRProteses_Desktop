import 'dart:io';

import 'package:collection/collection.dart';
import 'package:frproteses/src/core/enums/order_status_type.dart';
import 'package:frproteses/src/core/errors/exception.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/data/datasources/local/customer_local_data_source.dart';
import 'package:frproteses/src/data/datasources/local/product_local_data_source.dart';
import 'package:frproteses/src/data/models/order_model.dart';

abstract class IOrderLocalDataSource {
  /// Create or Update order locally
  ///
  /// Throws a [LocalException] for all error codes.
  Future<OrderModel> set(OrderModel orderModel);

  /// Get list of all registered orders
  ///
  /// Throws a [LocalException] for all error codes.
  Future<List<OrderModel>> getAll();

  /// Find order by id
  ///
  /// Throws a [LocalException] for all error codes.
  Future<OrderModel> getById(int id);

  /// Get next id for new order
  ///
  /// Throws a [LocalException] for all error codes.
  Future<int> getNextId();

  /// Close order with id.
  ///
  /// Throws a [LocalException] for all error codes.
  Future<OrderModel> setClose(int id);

  /// Clear database
  ///
  /// Throws a [LocalException] for all error codes.
  Future<void> clear();
}

class OrderLocalDataSourceImpl implements IOrderLocalDataSource {
  final File orderFile;
  final ICustomerLocalDataSource customerLocalDataSource;
  final IProductLocalDataSource productLocalDataSource;

  OrderLocalDataSourceImpl({
    required this.orderFile,
    required this.customerLocalDataSource,
    required this.productLocalDataSource,
  });

  @override
  Future<List<OrderModel>> getAll() async {
    try {
      if (!orderFile.existsSync()) {
        return List.empty(growable: true);
      }

      final lines = orderFile.readAsLinesSync();
      final orders = lines
          .map((line) => OrderModel.fromString(line.replaceAll("\n", "")))
          .toList();

      for (final order in orders) {
        await _updateCustomerModel(order);
        await _updateProductModel(order);
      }

      return orders;
    } on FileSystemException {
      throw LocalException();
    }
  }

  @override
  Future<OrderModel> getById(int id) async {
    final models = await getAll();
    final model = models.firstWhereOrNull((element) => element.id == id);

    if (model == null) {
      throw LocalException();
    }

    return model;
  }

  @override
  Future<OrderModel> set(OrderModel orderModel) async {
    final models = await getAll();
    final model =
        models.firstWhereOrNull((element) => element.id == orderModel.id);

    if (model == null) {
      models.add(orderModel);
    } else {
      final index = models.indexOf(model);
      models[index] = orderModel;
    }

    final lines = models.map((e) => e.toString()).toList();
    final content = StringBuffer();
    for (final line in lines) {
      content.write("$line\n");
    }

    try {
      orderFile.writeAsStringSync(content.toString());
      return orderModel;
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
  Future<OrderModel> setClose(int id) async {
    final model = await getById(id);

    if (model.statusType.isEqual(OrderStatusType.closed)) {
      throw LocalException();
    }

    model.statusType = OrderStatusType.closed;
    model.deliveryDate = DateTime.now().formatDate();

    return set(model);
  }

  Future<void> _updateCustomerModel(OrderModel order) async {
    final _customerId = order.customerEntity.id;
    final _updatedCustomer = await customerLocalDataSource.getById(_customerId);
    order.customerEntity = _updatedCustomer;
  }

  Future<void> _updateProductModel(OrderModel order) async {
    int index = 0;
    for (final item in order.itemsEntity) {
      final _productId = item.productEntity.id;
      final _updatedProduct = await productLocalDataSource.getById(_productId);
      order.itemsEntity[index].productEntity = _updatedProduct;

      if (order.statusType.isEqual(OrderStatusType.open)) {
        order.itemsEntity[index].unitPrice = _updatedProduct.price;
      }

      index++;
    }
  }

  @override
  Future<void> clear() async {
    try {
      orderFile.writeAsStringSync("");
    } on FileSystemException {
      throw LocalException();
    }
  }
}
