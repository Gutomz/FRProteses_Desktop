import 'package:frproteses/src/data/models/product_model.dart';
import 'package:frproteses/src/domain/entities/order_item_entity.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required int id,
    required ProductEntity product,
    required int quantity,
    required double unitPrice,
  }) : super(
          id: id,
          product: product,
          quantity: quantity,
          unitPrice: unitPrice,
        );

  factory OrderItemModel.copyFrom(OrderItemEntity orderItemEntity) {
    return OrderItemModel(
      id: orderItemEntity.id,
      product: orderItemEntity.product,
      quantity: orderItemEntity.quantity,
      unitPrice: orderItemEntity.unitPrice,
    );
  }

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: (json["id"] as num).toInt(),
      product: ProductModel.fromJson(json["product"]),
      quantity: (json["quantity"] as num).toInt(),
      unitPrice: (json["unitPrice"] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "product": ProductModel.copyFrom(product).toJson(),
      "quantity": quantity,
      "unitPrice": unitPrice,
    };
  }
}
