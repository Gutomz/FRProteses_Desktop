import 'package:frproteses/src/core/utils/constants.dart';
import 'package:frproteses/src/data/models/address_model.dart';
import 'package:frproteses/src/domain/entities/address_entity.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({
    required int id,
    required String name,
    required String lastName,
    required String phone,
    required String email,
    required String document,
    required AddressEntity addressModel,
    required String notes,
  }) : super(
          id: id,
          name: name,
          lastName: lastName,
          phone: phone,
          email: email,
          document: document,
          addressEntity: addressModel,
          notes: notes,
        );

  factory CustomerModel.empty() {
    return CustomerModel(
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

  factory CustomerModel.copyFrom(CustomerEntity customerEntity) {
    return CustomerModel(
      id: customerEntity.id,
      name: customerEntity.name,
      lastName: customerEntity.lastName,
      phone: customerEntity.phone,
      email: customerEntity.email,
      document: customerEntity.document,
      addressModel: AddressModel.copyFrom(customerEntity.addressEntity),
      notes: customerEntity.notes,
    );
  }

  factory CustomerModel.fromString(String str) {
    final fields = str.split(SplitFieldsPattern.customerModelPattern);

    try {
      return CustomerModel(
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
      return CustomerModel.empty();
    }
  }

  @override
  String toString() {
    const pattern = SplitFieldsPattern.customerModelPattern;
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
