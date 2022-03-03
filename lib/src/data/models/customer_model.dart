import 'package:frproteses/src/core/enums/document_type.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({
    required int id,
    required String name,
    required String phone,
    required String email,
    required String document,
    required DocumentType documentType,
    required String notes,
  }) : super(
          id: id,
          name: name,
          phone: phone,
          email: email,
          document: document,
          documentType: documentType,
          notes: notes,
        );

  factory CustomerModel.copyFrom(CustomerEntity customerEntity) {
    return CustomerModel(
      id: customerEntity.id,
      name: customerEntity.name,
      phone: customerEntity.phone,
      email: customerEntity.email,
      document: customerEntity.document,
      documentType: customerEntity.documentType,
      notes: customerEntity.notes,
    );
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: (json["id"] as num).toInt(),
      name: json["name"] as String,
      phone: json["phone"] as String,
      email: json["email"] as String,
      document: json["document"] as String,
      documentType: json["documentType"] as DocumentType,
      notes: json["notes"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
      "email": email,
      "document": document,
      "documentType": documentType,
      "notes": notes,
    };
  }
}
