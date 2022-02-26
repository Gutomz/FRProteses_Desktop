import 'package:frproteses/src/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required int id,
    required String name,
    required double price,
  }) : super(
          id: id,
          name: name,
          price: price,
        );

  factory ProductModel.copyFrom(ProductEntity productEntity) {
    return ProductModel(
      id: productEntity.id,
      name: productEntity.name,
      price: productEntity.price,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: (json["id"] as num).toInt(),
      name: json["name"],
      price: (json["price"] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
    };
  }
}
