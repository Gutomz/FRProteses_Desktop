enum DentalArchType {
  // Top Left (18-11)
  tl18,
  tl17,
  tl16,
  tl15,
  tl14,
  tl13,
  tl12,
  tl11,

  // Top Right (21-28)
  tr21,
  tr22,
  tr23,
  tr24,
  tr25,
  tr26,
  tr27,
  tr28,

  // Bottom Left (48-41)
  bl48,
  bl47,
  bl46,
  bl45,
  bl44,
  bl43,
  bl42,
  bl41,

  // Bottom Right (31-38)
  br31,
  br32,
  br33,
  br34,
  br35,
  br36,
  br37,
  br38,
}

extension DentalArchTypeExtension on DentalArchType {
  String get title {
    switch (this) {
      case DentalArchType.tl18:
        return "18";
      case DentalArchType.tl17:
        return "17";
      case DentalArchType.tl16:
        return "16";
      case DentalArchType.tl15:
        return "15";
      case DentalArchType.tl14:
        return "14";
      case DentalArchType.tl13:
        return "13";
      case DentalArchType.tl12:
        return "12";
      case DentalArchType.tl11:
        return "11";
      case DentalArchType.tr21:
        return "21";
      case DentalArchType.tr22:
        return "22";
      case DentalArchType.tr23:
        return "23";
      case DentalArchType.tr24:
        return "24";
      case DentalArchType.tr25:
        return "25";
      case DentalArchType.tr26:
        return "26";
      case DentalArchType.tr27:
        return "27";
      case DentalArchType.tr28:
        return "28";
      case DentalArchType.bl48:
        return "48";
      case DentalArchType.bl47:
        return "47";
      case DentalArchType.bl46:
        return "46";
      case DentalArchType.bl45:
        return "45";
      case DentalArchType.bl44:
        return "44";
      case DentalArchType.bl43:
        return "43";
      case DentalArchType.bl42:
        return "42";
      case DentalArchType.bl41:
        return "41";
      case DentalArchType.br31:
        return "31";
      case DentalArchType.br32:
        return "32";
      case DentalArchType.br33:
        return "33";
      case DentalArchType.br34:
        return "34";
      case DentalArchType.br35:
        return "35";
      case DentalArchType.br36:
        return "36";
      case DentalArchType.br37:
        return "37";
      case DentalArchType.br38:
        return "38";
      default:
        return "";
    }
  }
}
