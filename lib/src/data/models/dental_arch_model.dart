import 'package:frproteses/src/core/enums/dental_arch_type.dart';
import 'package:frproteses/src/domain/entities/dental_arch_entity.dart';

class DentalArchModel extends DentalArchEntity {
  DentalArchModel(Map<DentalArchType, bool> arch) : super(arch);

  factory DentalArchModel.copyFrom(DentalArchEntity dentalArchEntity) {
    return DentalArchModel(dentalArchEntity.arch);
  }

  factory DentalArchModel.fromJson(Map<String, dynamic> json) {
    return DentalArchModel({
      DentalArchType.tl18: json["tl18"],
      DentalArchType.tl17: json["tl17"],
      DentalArchType.tl16: json["tl16"],
      DentalArchType.tl15: json["tl15"],
      DentalArchType.tl14: json["tl14"],
      DentalArchType.tl13: json["tl13"],
      DentalArchType.tl12: json["tl12"],
      DentalArchType.tl11: json["tl11"],
      DentalArchType.tr21: json["tr21"],
      DentalArchType.tr22: json["tr22"],
      DentalArchType.tr23: json["tr23"],
      DentalArchType.tr24: json["tr24"],
      DentalArchType.tr25: json["tr25"],
      DentalArchType.tr26: json["tr26"],
      DentalArchType.tr27: json["tr27"],
      DentalArchType.tr28: json["tr28"],
      DentalArchType.bl48: json["bl48"],
      DentalArchType.bl47: json["bl47"],
      DentalArchType.bl46: json["bl46"],
      DentalArchType.bl45: json["bl45"],
      DentalArchType.bl44: json["bl44"],
      DentalArchType.bl43: json["bl43"],
      DentalArchType.bl42: json["bl42"],
      DentalArchType.bl41: json["bl41"],
      DentalArchType.br31: json["br31"],
      DentalArchType.br32: json["br32"],
      DentalArchType.br33: json["br33"],
      DentalArchType.br34: json["br34"],
      DentalArchType.br35: json["br35"],
      DentalArchType.br36: json["br36"],
      DentalArchType.br37: json["br37"],
      DentalArchType.br38: json["br38"],
    });
  }

  Map<String, dynamic> toJson() {
    return {
      "tl18": arch["tl18"],
      "tl17": arch["tl17"],
      "tl16": arch["tl16"],
      "tl15": arch["tl15"],
      "tl14": arch["tl14"],
      "tl13": arch["tl13"],
      "tl12": arch["tl12"],
      "tl11": arch["tl11"],
      "tr21": arch["tr21"],
      "tr22": arch["tr22"],
      "tr23": arch["tr23"],
      "tr24": arch["tr24"],
      "tr25": arch["tr25"],
      "tr26": arch["tr26"],
      "tr27": arch["tr27"],
      "tr28": arch["tr28"],
      "bl48": arch["bl48"],
      "bl47": arch["bl47"],
      "bl46": arch["bl46"],
      "bl45": arch["bl45"],
      "bl44": arch["bl44"],
      "bl43": arch["bl43"],
      "bl42": arch["bl42"],
      "bl41": arch["bl41"],
      "br31": arch["br31"],
      "br32": arch["br32"],
      "br33": arch["br33"],
      "br34": arch["br34"],
      "br35": arch["br35"],
      "br36": arch["br36"],
      "br37": arch["br37"],
      "br38": arch["br38"],
    };
  }
}
