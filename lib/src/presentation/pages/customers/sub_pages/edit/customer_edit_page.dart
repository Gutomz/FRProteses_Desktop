import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/customers/sub_pages/edit/customer_edit_large_screen_page.dart';
import 'package:frproteses/src/presentation/pages/customers/sub_pages/edit/store/customer_edit_page_store.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class CustomerEditPageArguments {
  final CustomerEntity customerEntity;
  final bool isNew;

  CustomerEditPageArguments({required this.customerEntity, this.isNew = false});
}

class CustomerEditPage extends StatelessWidget {
  final CustomerEditPageStore _store;
  final NavigationStore _navigationStore = sl();

  final CustomerEditPageArguments arguments;

  final TextEditingController nameFieldController;
  final TextEditingController lastNameFieldController;
  final TextEditingController emailFieldController;
  final MaskedTextController documentNameFieldController;
  final MaskedTextController phoneFieldController;
  final MaskedTextController cepFieldController;
  final TextEditingController streetFieldController;
  final TextEditingController neighborhoodFieldController;
  final TextEditingController cityFieldController;
  final TextEditingController stateFieldController;
  final TextEditingController notesFieldController;

  CustomerEditPage({Key? key, required this.arguments})
      : _store = CustomerEditPageStore(
          arguments.customerEntity,
          customerStore: sl(),
        ),
        nameFieldController =
            TextEditingController(text: arguments.customerEntity.name),
        lastNameFieldController =
            TextEditingController(text: arguments.customerEntity.lastName),
        emailFieldController =
            TextEditingController(text: arguments.customerEntity.email),
        documentNameFieldController = MaskedTextController(
          text: arguments.customerEntity.document,
          mask: "000.000.000-00",
        ),
        phoneFieldController = MaskedTextController(
          text: arguments.customerEntity.phone,
          mask: "(00) 9 0000-0000",
        ),
        cepFieldController = MaskedTextController(
          text: arguments.customerEntity.addressEntity.cep,
          mask: "00000-000",
        ),
        streetFieldController = TextEditingController(
          text: arguments.customerEntity.addressEntity.street,
        ),
        neighborhoodFieldController = TextEditingController(
          text: arguments.customerEntity.addressEntity.neighborhood,
        ),
        cityFieldController = TextEditingController(
          text: arguments.customerEntity.addressEntity.city,
        ),
        stateFieldController = TextEditingController(
          text: arguments.customerEntity.addressEntity.state,
        ),
        notesFieldController =
            TextEditingController(text: arguments.customerEntity.notes),
        super(key: key);

  Future<void> saveForm(BuildContext context) async {
    final entity = await _store.saveForm();

    if (entity == null) {
      // ! TODO - Show error Message (customerStore.errorMessage)
      return;
    }

    _navigationStore.goBack();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreenWidget: Observer(
        builder: (context) {
          return CustomerEditLargeScreenPage(
            id: _store.id.toString(),
            nameFieldController: nameFieldController,
            onChangedNameField: _store.setName,
            nameFieldErrorText: _store.nameFieldErrorMessage,
            lastNameFieldController: lastNameFieldController,
            onChangedLastNameField: _store.setLastName,
            lastNameFieldErrorText: _store.lastNameFieldErrorMessage,
            emailFieldController: emailFieldController,
            onChangedEmailField: _store.setEmail,
            emailFieldErrorText: _store.emailFieldErrorMessage,
            documentFieldController: documentNameFieldController,
            onChangedDocumentField: _store.setDocument,
            documentFieldErrorText: _store.documentFieldErrorMessage,
            phoneFieldController: phoneFieldController,
            onChangedPhoneField: _store.setPhone,
            phoneFieldErrorText: _store.phoneFieldErrorMessage,
            cepFieldController: cepFieldController,
            onChangedCepField: _store.setCep,
            cepFieldErrorText: _store.cepFieldErrorMessage,
            streetFieldController: streetFieldController,
            onChangedStreetField: _store.setStreet,
            streetFieldErrorText: _store.streetFieldErrorMessage,
            neighborhoodFieldController: neighborhoodFieldController,
            onChangedNeighborhoodField: _store.setNeighborhood,
            neighborhoodFieldErrorText: _store.neighborhoodFieldErrorMessage,
            cityFieldController: cityFieldController,
            onChangedCityField: _store.setCity,
            cityFieldErrorText: _store.cityFieldErrorMessage,
            stateFieldController: stateFieldController,
            onChangedStateField: _store.setState,
            stateFieldErrorText: _store.stateFieldErrorMessage,
            notesFieldController: notesFieldController,
            onChangedNotesField: _store.setNotes,
            notesFieldErrorText: _store.notesFieldErrorMessage,
            onPressedSaveButton: () => saveForm(context),
          );
        },
      ),
    );
  }
}
