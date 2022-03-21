class ProductEntity {
  int id;
  String name;
  double price;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
  });

  factory ProductEntity.empty(int id) {
    return ProductEntity(
      id: id,
      name: "",
      price: 0,
    );
  }
}
