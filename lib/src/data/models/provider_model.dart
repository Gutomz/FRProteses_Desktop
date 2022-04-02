import 'package:frproteses/src/core/utils/constants.dart';
import 'package:frproteses/src/data/models/address_model.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';

class ProviderModel extends ProviderEntity {
  ProviderModel({
    required int id,
    required String name,
    required String lastName,
    required String phone,
    required String email,
    required AddressModel addressModel,
    required String document,
    required String notes,
  }) : super(
          id: id,
          name: name,
          lastName: lastName,
          phone: phone,
          email: email,
          addressEntity: addressModel,
          document: document,
          notes: notes,
        );

  factory ProviderModel.empty() {
    return ProviderModel(
      id: 0,
      name: "",
      lastName: "",
      phone: "",
      email: "",
      document: "",
      addressModel: AddressModel.empty(),
      notes: "",
    );
  }

  factory ProviderModel.copyFrom(ProviderEntity providerEntity) {
    return ProviderModel(
      id: providerEntity.id,
      name: providerEntity.name,
      lastName: providerEntity.lastName,
      phone: providerEntity.phone,
      email: providerEntity.email,
      addressModel: AddressModel.copyFrom(providerEntity.addressEntity),
      document: providerEntity.document,
      notes: providerEntity.notes,
    );
  }

  factory ProviderModel.fromString(String str) {
    final fields = str.split(SplitFieldsPattern.providerModelPattern);

    try {
      return ProviderModel(
        id: num.parse(fields[0]).toInt(),
        name: fields[1],
        lastName: fields[2],
        phone: fields[3],
        email: fields[4],
        document: fields[5],
        addressModel: AddressModel.fromString(fields[6]),
        notes: fields[7],
      );
    } on Exception {
      return ProviderModel.empty();
    }
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.providerModelPattern;
    final str = StringBuffer();
    str.write("$id$pattern");
    str.write("$name$pattern");
    str.write("$lastName$pattern");
    str.write("$phone$pattern");
    str.write("$email$pattern");
    str.write("$document$pattern");
    str.write(
      "${addressEntity.toString()}$pattern",
    );
    str.write(notes);
    return str.toString();
  }
}
