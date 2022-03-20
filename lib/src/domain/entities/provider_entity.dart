import 'package:frproteses/src/domain/entities/address_entity.dart';

class ProviderEntity {
  int id;
  String name;
  String lastName;
  String phone;
  String email;
  AddressEntity addressEntity;
  String document;
  String notes;

  ProviderEntity({
    required this.id,
    required this.name,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.addressEntity,
    required this.document,
    required this.notes,
  });

  factory ProviderEntity.empty(int id) {
    return ProviderEntity(
      id: id,
      name: "",
      lastName: "",
      phone: "",
      email: "",
      document: "",
      addressEntity: AddressEntity.empty(),
      notes: "",
    );
  }

  String get fullName => "$name $lastName";
}
