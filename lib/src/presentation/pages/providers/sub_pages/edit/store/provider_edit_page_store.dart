import 'package:frproteses/src/domain/entities/address_entity.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/stores/provider_store.dart';
import 'package:mobx/mobx.dart';
part 'provider_edit_page_store.g.dart';

class ProviderEditPageStore = _ProviderEditPageStoreBase
    with _$ProviderEditPageStore;

abstract class _ProviderEditPageStoreBase with Store {
  final ProviderStore providerStore;

  int id;

  @observable
  String name;

  @observable
  String lastName;

  @observable
  String email;

  @observable
  String phone;

  @observable
  String document;

  @observable
  String cep;

  @observable
  String street;

  @observable
  String neighborhood;

  @observable
  String city;

  @observable
  String state;

  @observable
  String notes;

  @observable
  bool triedToCompleteTheForm = false;

  _ProviderEditPageStoreBase(
    ProviderEntity initialEntity, {
    required this.providerStore,
  })  : id = initialEntity.id,
        name = initialEntity.name,
        lastName = initialEntity.lastName,
        email = initialEntity.email,
        phone = initialEntity.phone,
        document = initialEntity.document,
        cep = initialEntity.addressEntity.cep,
        street = initialEntity.addressEntity.street,
        neighborhood = initialEntity.addressEntity.neighborhood,
        city = initialEntity.addressEntity.city,
        state = initialEntity.addressEntity.state,
        notes = initialEntity.notes;

  Future<ProviderEntity?> saveForm() async {
    setTriedToCompleteTheForm();

    if (!isFormValid) return null;

    final formData = convertFormData();

    final savedModel = await providerStore.set(formData);

    return savedModel;
  }

  ProviderEntity convertFormData() {
    return ProviderEntity(
      id: id,
      name: name,
      lastName: lastName,
      phone: phone,
      email: email,
      document: document,
      addressEntity: AddressEntity(
        cep: cep,
        street: street,
        neighborhood: neighborhood,
        city: city,
        state: state,
      ),
      notes: notes,
    );
  }

  @action
  void setName(String value) => name = value;

  @action
  void setLastName(String value) => lastName = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setDocument(String value) => document = value;

  @action
  void setCep(String value) => cep = value;

  @action
  void setStreet(String value) => street = value;

  @action
  void setNeighborhood(String value) => neighborhood = value;

  @action
  void setCity(String value) => city = value;

  @action
  void setState(String value) => state = value;

  @action
  void setNotes(String value) => notes = value;

  @action
  void setTriedToCompleteTheForm() => triedToCompleteTheForm = true;

  @computed
  bool get isNameValid => name.isNotEmpty && name.length > 1;

  @computed
  bool get isLastNameValid => true;

  @computed
  bool get isEmailValid => true;

  @computed
  bool get isPhoneValid => true;

  @computed
  bool get isDocumentValid => true;

  @computed
  bool get isCepValid => true;

  @computed
  bool get isStreetValid => true;

  @computed
  bool get isNeighborhoodValid => true;

  @computed
  bool get isCityValid => true;

  @computed
  bool get isStateValid => true;

  @computed
  bool get isNotesValid => true;

  @computed
  bool get isFormValid =>
      isNameValid &&
      isLastNameValid &&
      isEmailValid &&
      isPhoneValid &&
      isDocumentValid &&
      isCepValid &&
      isStreetValid &&
      isNeighborhoodValid &&
      isCityValid &&
      isStateValid &&
      isNotesValid;

  @computed
  String? get nameFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      if (name.isEmpty) {
        message = FieldErrorMessages.requiredField;
      } else if (!isNameValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get lastNameFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* Not required field */
      if (!isLastNameValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get emailFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* Not required field */
      if (!isEmailValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get phoneFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* Not required field */
      if (!isPhoneValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get documentFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* Not required field */
      if (!isDocumentValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get cepFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* Not required field */
      if (!isCepValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get streetFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* Not required field */
      if (!isStreetValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get neighborhoodFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* Not required field */
      if (!isNeighborhoodValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get cityFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* Not required field */
      if (!isCityValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get stateFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* Not required field */
      if (!isStateValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }

  @computed
  String? get notesFieldErrorMessage {
    String? message;

    if (triedToCompleteTheForm) {
      /* Not required field */
      if (!isNotesValid) {
        message = FieldErrorMessages.invalidField;
      }
    }

    return message;
  }
}
