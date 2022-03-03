extension IntExtension on int {
  bool toBool() {
    return this == 1;
  }
}

extension BoolExtension on bool? {
  int toInt() {
    return this == true ? 1 : 0;
  }
}
