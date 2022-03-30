enum OrderStatusType {
  open,
  closed,
}

extension OrderStatusTypeExtension on OrderStatusType {
  String get title {
    switch (index) {
      case 0:
        return "Aberto";
      case 1:
        return "Fechado";
      default:
        return "";
    }
  }

  bool isEqual(OrderStatusType other) {
    return other.index == index;
  }

  static OrderStatusType parse(String str) {
    final index = num.tryParse(str)?.toInt() ?? 0;
    return OrderStatusType.values[index];
  }
}
