import 'package:frproteses/src/domain/entities/product_entity.dart';

class OrderItemEntity {
  int id;
  ProductEntity product;
  int quantity;
  late double unitPrice;

  OrderItemEntity({
    required this.id,
    required this.product,
    required this.quantity,
  }) {
    unitPrice = product.price;
  }
}
