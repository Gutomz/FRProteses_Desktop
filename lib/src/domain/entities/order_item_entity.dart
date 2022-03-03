import 'package:frproteses/src/domain/entities/product_entity.dart';

class OrderItemEntity {
  int id;
  ProductEntity product;
  int quantity;
  double unitPrice;

  OrderItemEntity({
    required this.id,
    required this.product,
    required this.quantity,
    required this.unitPrice,
  });
}
