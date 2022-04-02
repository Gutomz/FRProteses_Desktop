import 'package:frproteses/src/core/utils/constants.dart';
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

  factory ProductModel.empty() {
    return ProductModel(
      id: 0,
      name: "",
      price: 0,
    );
  }

  factory ProductModel.copyFrom(ProductEntity productEntity) {
    return ProductModel(
      id: productEntity.id,
      name: productEntity.name,
      price: productEntity.price,
    );
  }

  factory ProductModel.fromString(String str) {
    final fields = str.split(SplitFieldsPattern.productModelPattern);

    try {
      return ProductModel(
        id: num.parse(fields[0]).toInt(),
        name: fields[1],
        price: num.parse(fields[2]).toDouble(),
      );
    } on Exception {
      return ProductModel.empty();
    }
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.productModelPattern;
    final str = StringBuffer();
    str.write("$id$pattern");
    str.write("$name$pattern");
    str.write("$price$pattern");
    return str.toString();
  }
}
