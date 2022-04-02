import 'package:frproteses/src/core/utils/constants.dart';
import 'package:frproteses/src/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required String cep,
    required String street,
    required String neighborhood,
    required String city,
    required String state,
  }) : super(
          cep: cep,
          street: street,
          neighborhood: neighborhood,
          city: city,
          state: state,
        );

  factory AddressModel.empty() {
    return AddressModel(
      cep: "",
      street: "",
      neighborhood: "",
      city: "",
      state: "",
    );
  }

  factory AddressModel.copyFrom(AddressEntity addressEntity) {
    return AddressModel(
      cep: addressEntity.cep,
      street: addressEntity.street,
      neighborhood: addressEntity.neighborhood,
      city: addressEntity.city,
      state: addressEntity.state,
    );
  }

  factory AddressModel.fromString(String str) {
    final fields = str.split(SplitFieldsPattern.addressModelPattern);
    try {
      return AddressModel(
        cep: fields[0],
        street: fields[1],
        neighborhood: fields[2],
        city: fields[3],
        state: fields[4],
      );
    } on Exception {
      return AddressModel.empty();
    }
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.addressModelPattern;
    final str = StringBuffer();
    str.write("$cep$pattern");
    str.write("$street$pattern");
    str.write("$neighborhood$pattern");
    str.write("$city$pattern");
    str.write("$state$pattern");
    return str.toString();
  }
}
