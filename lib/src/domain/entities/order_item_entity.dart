import 'package:frproteses/src/domain/entities/product_entity.dart';

class OrderItemEntity {
  int id;
  ProductEntity productEntity;
  int quantity;
  double unitPrice;

  OrderItemEntity({
    required this.id,
    required this.productEntity,
    required this.quantity,
    required this.unitPrice,
  });

  factory OrderItemEntity.empty(int id) {
    return OrderItemEntity(
      id: id,
      productEntity: ProductEntity.empty(0),
      quantity: 0,
      unitPrice: 0,
    );
  }

  double get totalPrice => unitPrice * quantity;
}
