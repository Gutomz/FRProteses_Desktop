enum PaymentMethodType {
  money,
  check,
  preCheck,
}

extension PaymentMethodTypeExtension on PaymentMethodType {
  String get title {
    switch (index) {
      case 0:
        return "Dinheiro";
      case 1:
        return "Cheque";
      case 2:
        return "Cheque Pré-Datado";
      default:
        return "";
    }
  }

  bool isEqual(PaymentMethodType other) {
    return other.index == index;
  }

  static PaymentMethodType parse(String str) {
    final index = num.tryParse(str)?.toInt() ?? 0;
    return PaymentMethodType.values[index];
  }
}
