import 'package:frproteses/src/core/enums/dental_arch_type.dart';

class DentalArchEntity {
  final Map<DentalArchType, bool> arch;

  DentalArchEntity(this.arch);

  factory DentalArchEntity.empty() {
    return DentalArchEntity({
      DentalArchType.tl18: false,
      DentalArchType.tl17: false,
      DentalArchType.tl16: false,
      DentalArchType.tl15: false,
      DentalArchType.tl14: false,
      DentalArchType.tl13: false,
      DentalArchType.tl12: false,
      DentalArchType.tl11: false,
      DentalArchType.tr21: false,
      DentalArchType.tr22: false,
      DentalArchType.tr23: false,
      DentalArchType.tr24: false,
      DentalArchType.tr25: false,
      DentalArchType.tr26: false,
      DentalArchType.tr27: false,
      DentalArchType.tr28: false,
      DentalArchType.bl48: false,
      DentalArchType.bl47: false,
      DentalArchType.bl46: false,
      DentalArchType.bl45: false,
      DentalArchType.bl44: false,
      DentalArchType.bl43: false,
      DentalArchType.bl42: false,
      DentalArchType.bl41: false,
      DentalArchType.br31: false,
      DentalArchType.br32: false,
      DentalArchType.br33: false,
      DentalArchType.br34: false,
      DentalArchType.br35: false,
      DentalArchType.br36: false,
      DentalArchType.br37: false,
      DentalArchType.br38: false,
    });
  }

  bool setTeeth(DentalArchType dentalArchType, bool value) {
    if (arch.containsKey(dentalArchType)) {
      return arch.update(dentalArchType, (_) => value);
    }

    return false;
  }
}
