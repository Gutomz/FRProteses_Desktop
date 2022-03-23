enum OrderModelType {
  type0,
  type1,
  type2,
  type3,
}

extension OrderModelTypeExtension on OrderModelType {
  String get title {
    switch (index) {
      case 0:
        return "Tipo 0";
      case 1:
        return "Tipo 1";
      case 2:
        return "Tipo 2";
      case 3:
        return "Tipo 3";
      default:
        return "";
    }
  }

  bool isEqual(OrderModelType other) {
    return other.index == index;
  }

  static OrderModelType parse(String str) {
    final index = num.tryParse(str)?.toInt() ?? 0;
    return OrderModelType.values[index];
  }
}
