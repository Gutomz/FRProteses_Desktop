import 'package:frproteses/src/core/enums/document_type.dart';
import 'package:frproteses/src/domain/entities/address_entity.dart';

class ProviderEntity {
  int id;
  String name;
  String phone;
  String email;
  AddressEntity address;
  String document;
  DocumentType documentType;
  String notes;

  ProviderEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.document,
    required this.documentType,
    required this.notes,
  });
}
