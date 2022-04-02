import 'package:frproteses/src/core/enums/dental_arch_type.dart';
import 'package:frproteses/src/core/utils/constants.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/dental_arch_entity.dart';

class DentalArchModel extends DentalArchEntity {
  DentalArchModel(Map<DentalArchType, bool> arch) : super(arch);

  factory DentalArchModel.empty() {
    return DentalArchModel.copyFrom(DentalArchEntity.empty());
  }

  factory DentalArchModel.copyFrom(DentalArchEntity dentalArchEntity) {
    return DentalArchModel(dentalArchEntity.arch);
  }

  factory DentalArchModel.fromString(String str) {
    final fields = str.split(SplitFieldsPattern.dentalArchModelPattern);

    final model = DentalArchModel.empty();
    try {
      model.setTeeth(DentalArchType.tl18,
          value: num.parse(fields[0]).toInt().toBool());
      model.setTeeth(DentalArchType.tl17,
          value: num.parse(fields[1]).toInt().toBool());
      model.setTeeth(DentalArchType.tl16,
          value: num.parse(fields[2]).toInt().toBool());
      model.setTeeth(DentalArchType.tl15,
          value: num.parse(fields[3]).toInt().toBool());
      model.setTeeth(DentalArchType.tl14,
          value: num.parse(fields[4]).toInt().toBool());
      model.setTeeth(DentalArchType.tl13,
          value: num.parse(fields[5]).toInt().toBool());
      model.setTeeth(DentalArchType.tl12,
          value: num.parse(fields[6]).toInt().toBool());
      model.setTeeth(DentalArchType.tl11,
          value: num.parse(fields[7]).toInt().toBool());
      model.setTeeth(DentalArchType.tr21,
          value: num.parse(fields[8]).toInt().toBool());
      model.setTeeth(DentalArchType.tr22,
          value: num.parse(fields[9]).toInt().toBool());
      model.setTeeth(DentalArchType.tr23,
          value: num.parse(fields[10]).toInt().toBool());
      model.setTeeth(DentalArchType.tr24,
          value: num.parse(fields[11]).toInt().toBool());
      model.setTeeth(DentalArchType.tr25,
          value: num.parse(fields[12]).toInt().toBool());
      model.setTeeth(DentalArchType.tr26,
          value: num.parse(fields[13]).toInt().toBool());
      model.setTeeth(DentalArchType.tr27,
          value: num.parse(fields[14]).toInt().toBool());
      model.setTeeth(DentalArchType.tr28,
          value: num.parse(fields[15]).toInt().toBool());
      model.setTeeth(DentalArchType.bl48,
          value: num.parse(fields[16]).toInt().toBool());
      model.setTeeth(DentalArchType.bl47,
          value: num.parse(fields[17]).toInt().toBool());
      model.setTeeth(DentalArchType.bl46,
          value: num.parse(fields[18]).toInt().toBool());
      model.setTeeth(DentalArchType.bl45,
          value: num.parse(fields[19]).toInt().toBool());
      model.setTeeth(DentalArchType.bl44,
          value: num.parse(fields[20]).toInt().toBool());
      model.setTeeth(DentalArchType.bl43,
          value: num.parse(fields[21]).toInt().toBool());
      model.setTeeth(DentalArchType.bl42,
          value: num.parse(fields[22]).toInt().toBool());
      model.setTeeth(DentalArchType.bl41,
          value: num.parse(fields[23]).toInt().toBool());
      model.setTeeth(DentalArchType.br31,
          value: num.parse(fields[24]).toInt().toBool());
      model.setTeeth(DentalArchType.br32,
          value: num.parse(fields[25]).toInt().toBool());
      model.setTeeth(DentalArchType.br33,
          value: num.parse(fields[26]).toInt().toBool());
      model.setTeeth(DentalArchType.br34,
          value: num.parse(fields[27]).toInt().toBool());
      model.setTeeth(DentalArchType.br35,
          value: num.parse(fields[28]).toInt().toBool());
      model.setTeeth(DentalArchType.br36,
          value: num.parse(fields[29]).toInt().toBool());
      model.setTeeth(DentalArchType.br37,
          value: num.parse(fields[30]).toInt().toBool());
      model.setTeeth(DentalArchType.br38,
          value: num.parse(fields[31]).toInt().toBool());

      return model;
    } on Exception {
      return model;
    }
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.dentalArchModelPattern;
    final str = StringBuffer();
    str.write("${arch[DentalArchType.tl18].toInt()}$pattern");
    str.write("${arch[DentalArchType.tl17].toInt()}$pattern");
    str.write("${arch[DentalArchType.tl16].toInt()}$pattern");
    str.write("${arch[DentalArchType.tl15].toInt()}$pattern");
    str.write("${arch[DentalArchType.tl14].toInt()}$pattern");
    str.write("${arch[DentalArchType.tl13].toInt()}$pattern");
    str.write("${arch[DentalArchType.tl12].toInt()}$pattern");
    str.write("${arch[DentalArchType.tl11].toInt()}$pattern");
    str.write("${arch[DentalArchType.tr21].toInt()}$pattern");
    str.write("${arch[DentalArchType.tr22].toInt()}$pattern");
    str.write("${arch[DentalArchType.tr23].toInt()}$pattern");
    str.write("${arch[DentalArchType.tr24].toInt()}$pattern");
    str.write("${arch[DentalArchType.tr25].toInt()}$pattern");
    str.write("${arch[DentalArchType.tr26].toInt()}$pattern");
    str.write("${arch[DentalArchType.tr27].toInt()}$pattern");
    str.write("${arch[DentalArchType.tr28].toInt()}$pattern");
    str.write("${arch[DentalArchType.bl48].toInt()}$pattern");
    str.write("${arch[DentalArchType.bl47].toInt()}$pattern");
    str.write("${arch[DentalArchType.bl46].toInt()}$pattern");
    str.write("${arch[DentalArchType.bl45].toInt()}$pattern");
    str.write("${arch[DentalArchType.bl44].toInt()}$pattern");
    str.write("${arch[DentalArchType.bl43].toInt()}$pattern");
    str.write("${arch[DentalArchType.bl42].toInt()}$pattern");
    str.write("${arch[DentalArchType.bl41].toInt()}$pattern");
    str.write("${arch[DentalArchType.br31].toInt()}$pattern");
    str.write("${arch[DentalArchType.br32].toInt()}$pattern");
    str.write("${arch[DentalArchType.br33].toInt()}$pattern");
    str.write("${arch[DentalArchType.br34].toInt()}$pattern");
    str.write("${arch[DentalArchType.br35].toInt()}$pattern");
    str.write("${arch[DentalArchType.br36].toInt()}$pattern");
    str.write("${arch[DentalArchType.br37].toInt()}$pattern");
    str.write("${arch[DentalArchType.br38].toInt()}");
    return str.toString();
  }
}
