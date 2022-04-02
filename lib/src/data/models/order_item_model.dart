import 'package:frproteses/src/core/utils/constants.dart';
import 'package:frproteses/src/data/models/product_model.dart';
import 'package:frproteses/src/domain/entities/order_item_entity.dart';

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required int id,
    required ProductModel productModel,
    required int quantity,
    required double unitPrice,
  }) : super(
          id: id,
          productEntity: productModel,
          quantity: quantity,
          unitPrice: unitPrice,
        );

  factory OrderItemModel.empty() {
    return OrderItemModel.copyFrom(OrderItemEntity.empty(0));
  }

  factory OrderItemModel.copyFrom(OrderItemEntity orderItemEntity) {
    return OrderItemModel(
      id: orderItemEntity.id,
      productModel: ProductModel.copyFrom(orderItemEntity.productEntity),
      quantity: orderItemEntity.quantity,
      unitPrice: orderItemEntity.unitPrice,
    );
  }

  factory OrderItemModel.fromString(String str) {
    final fields = str.split(SplitFieldsPattern.orderItemModelPattern);

    try {
      return OrderItemModel(
        id: num.parse(fields[0]).toInt(),
        productModel: ProductModel.fromString(fields[1]),
        quantity: num.parse(fields[2]).toInt(),
        unitPrice: num.parse(fields[3]).toDouble(),
      );
    } on Exception {
      return OrderItemModel.empty();
    }
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.orderItemModelPattern;
    final str = StringBuffer();
    str.write("$id$pattern");
    str.write("${ProductModel.copyFrom(productEntity).toString()}$pattern");
    str.write("$quantity$pattern");
    str.write("$unitPrice$pattern");
    return str.toString();
  }
}
