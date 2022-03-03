import 'package:frproteses/src/core/enums/dental_arch_type.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/dental_arch_entity.dart';

class DentalArchModel extends DentalArchEntity {
  DentalArchModel(Map<DentalArchType, bool> arch) : super(arch);

  factory DentalArchModel.copyFrom(DentalArchEntity dentalArchEntity) {
    return DentalArchModel(dentalArchEntity.arch);
  }

  factory DentalArchModel.fromJson(Map<String, dynamic> json) {
    return DentalArchModel({
      DentalArchType.tl18: (json["tl18"] as num).toInt().toBool(),
      DentalArchType.tl17: (json["tl17"] as num).toInt().toBool(),
      DentalArchType.tl16: (json["tl16"] as num).toInt().toBool(),
      DentalArchType.tl15: (json["tl15"] as num).toInt().toBool(),
      DentalArchType.tl14: (json["tl14"] as num).toInt().toBool(),
      DentalArchType.tl13: (json["tl13"] as num).toInt().toBool(),
      DentalArchType.tl12: (json["tl12"] as num).toInt().toBool(),
      DentalArchType.tl11: (json["tl11"] as num).toInt().toBool(),
      DentalArchType.tr21: (json["tr21"] as num).toInt().toBool(),
      DentalArchType.tr22: (json["tr22"] as num).toInt().toBool(),
      DentalArchType.tr23: (json["tr23"] as num).toInt().toBool(),
      DentalArchType.tr24: (json["tr24"] as num).toInt().toBool(),
      DentalArchType.tr25: (json["tr25"] as num).toInt().toBool(),
      DentalArchType.tr26: (json["tr26"] as num).toInt().toBool(),
      DentalArchType.tr27: (json["tr27"] as num).toInt().toBool(),
      DentalArchType.tr28: (json["tr28"] as num).toInt().toBool(),
      DentalArchType.bl48: (json["bl48"] as num).toInt().toBool(),
      DentalArchType.bl47: (json["bl47"] as num).toInt().toBool(),
      DentalArchType.bl46: (json["bl46"] as num).toInt().toBool(),
      DentalArchType.bl45: (json["bl45"] as num).toInt().toBool(),
      DentalArchType.bl44: (json["bl44"] as num).toInt().toBool(),
      DentalArchType.bl43: (json["bl43"] as num).toInt().toBool(),
      DentalArchType.bl42: (json["bl42"] as num).toInt().toBool(),
      DentalArchType.bl41: (json["bl41"] as num).toInt().toBool(),
      DentalArchType.br31: (json["br31"] as num).toInt().toBool(),
      DentalArchType.br32: (json["br32"] as num).toInt().toBool(),
      DentalArchType.br33: (json["br33"] as num).toInt().toBool(),
      DentalArchType.br34: (json["br34"] as num).toInt().toBool(),
      DentalArchType.br35: (json["br35"] as num).toInt().toBool(),
      DentalArchType.br36: (json["br36"] as num).toInt().toBool(),
      DentalArchType.br37: (json["br37"] as num).toInt().toBool(),
      DentalArchType.br38: (json["br38"] as num).toInt().toBool(),
    });
  }

  Map<String, dynamic> toJson() {
    return {
      "tl18": arch["tl18"].toInt(),
      "tl17": arch["tl17"].toInt(),
      "tl16": arch["tl16"].toInt(),
      "tl15": arch["tl15"].toInt(),
      "tl14": arch["tl14"].toInt(),
      "tl13": arch["tl13"].toInt(),
      "tl12": arch["tl12"].toInt(),
      "tl11": arch["tl11"].toInt(),
      "tr21": arch["tr21"].toInt(),
      "tr22": arch["tr22"].toInt(),
      "tr23": arch["tr23"].toInt(),
      "tr24": arch["tr24"].toInt(),
      "tr25": arch["tr25"].toInt(),
      "tr26": arch["tr26"].toInt(),
      "tr27": arch["tr27"].toInt(),
      "tr28": arch["tr28"].toInt(),
      "bl48": arch["bl48"].toInt(),
      "bl47": arch["bl47"].toInt(),
      "bl46": arch["bl46"].toInt(),
      "bl45": arch["bl45"].toInt(),
      "bl44": arch["bl44"].toInt(),
      "bl43": arch["bl43"].toInt(),
      "bl42": arch["bl42"].toInt(),
      "bl41": arch["bl41"].toInt(),
      "br31": arch["br31"].toInt(),
      "br32": arch["br32"].toInt(),
      "br33": arch["br33"].toInt(),
      "br34": arch["br34"].toInt(),
      "br35": arch["br35"].toInt(),
      "br36": arch["br36"].toInt(),
      "br37": arch["br37"].toInt(),
      "br38": arch["br38"].toInt(),
    };
  }
}
