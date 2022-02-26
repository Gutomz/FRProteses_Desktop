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

  factory AddressModel.copyFrom(AddressEntity addressEntity) {
    return AddressModel(
      cep: addressEntity.cep,
      street: addressEntity.street,
      neighborhood: addressEntity.neighborhood,
      city: addressEntity.city,
      state: addressEntity.state,
    );
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      cep: json["cep"],
      street: json["street"],
      neighborhood: json["neighborhood"],
      city: json["city"],
      state: json["state"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cep": cep,
      "street": street,
      "neighborhood": neighborhood,
      "city": city,
      "state": state,
    };
  }
}
