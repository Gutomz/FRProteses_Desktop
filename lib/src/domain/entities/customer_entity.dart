import 'package:frproteses/src/domain/entities/address_entity.dart';

class CustomerEntity {
  int id;
  String name;
  String lastName;
  String phone;
  String email;
  String document;
  AddressEntity addressEntity;
  String notes;

  CustomerEntity({
    required this.id,
    required this.name,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.document,
    required this.addressEntity,
    required this.notes,
  });

  factory CustomerEntity.empty(int id) {
    return CustomerEntity(
      id: id,
      name: "",
      lastName: "",
      phone: "",
      email: "",
      document: "",
      addressEntity: AddressEntity(
        cep: "",
        street: "",
        neighborhood: "",
        city: "",
        state: "",
      ),
      notes: "",
    );
  }

  String get fullName => "$name $lastName";
}
