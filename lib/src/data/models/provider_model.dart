import 'package:frproteses/src/data/models/address_model.dart';
import 'package:frproteses/src/domain/entities/address_entity.dart';
import 'package:frproteses/src/core/enums/document_type.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';

class ProviderModel extends ProviderEntity {
  ProviderModel({
    required int id,
    required String name,
    required String phone,
    required String email,
    required AddressEntity address,
    required String document,
    required DocumentType documentType,
    required String notes,
  }) : super(
          id: id,
          name: name,
          phone: phone,
          email: email,
          address: address,
          document: document,
          documentType: documentType,
          notes: notes,
        );

  factory ProviderModel.copyFrom(ProviderEntity providerEntity) {
    return ProviderModel(
      id: providerEntity.id,
      name: providerEntity.name,
      phone: providerEntity.phone,
      email: providerEntity.email,
      address: providerEntity.address,
      document: providerEntity.document,
      documentType: providerEntity.documentType,
      notes: providerEntity.notes,
    );
  }

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      id: (json["id"] as num).toInt(),
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      address: AddressModel.fromJson(json["address"]),
      document: json["document"],
      documentType: json["documentType"],
      notes: json["notes"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
      "email": email,
      "address": AddressModel.copyFrom(address).toJson(),
      "document": document,
      "documentType": documentType,
      "notes": notes,
    };
  }
}
