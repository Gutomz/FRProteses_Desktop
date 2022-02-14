import 'package:frproteses/src/core/enums/document_type.dart';

class CustomerEntity {
  int id;
  String name;
  String phone;
  String email;
  String document;
  DocumentType documentType;
  String notes;

  CustomerEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.document,
    required this.documentType,
    required this.notes,
  });
}
