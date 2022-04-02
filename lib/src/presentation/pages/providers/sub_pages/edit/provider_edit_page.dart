import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/providers/sub_pages/edit/provider_edit_large_screen_page.dart';
import 'package:frproteses/src/presentation/pages/providers/sub_pages/edit/store/provider_edit_page_store.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class ProviderEditPageArguments {
  final ProviderEntity providerEntity;
  final bool isNew;

  ProviderEditPageArguments({required this.providerEntity, this.isNew = false});
}

class ProviderEditPage extends StatelessWidget {
  final ProviderEditPageStore _store;
  final NavigationStore _navigationStore = sl();

  final ProviderEditPageArguments arguments;

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

  ProviderEditPage({Key? key, required this.arguments})
      : _store = ProviderEditPageStore(
          arguments.providerEntity,
          providerStore: sl(),
        ),
        nameFieldController =
            TextEditingController(text: arguments.providerEntity.name),
        lastNameFieldController =
            TextEditingController(text: arguments.providerEntity.lastName),
        emailFieldController =
            TextEditingController(text: arguments.providerEntity.email),
        documentNameFieldController = MaskedTextController(
          text: arguments.providerEntity.document,
          mask: "000.000.000-00",
        ),
        phoneFieldController = MaskedTextController(
          text: arguments.providerEntity.phone,
          mask: "(00) 9 0000-0000",
        ),
        cepFieldController = MaskedTextController(
          text: arguments.providerEntity.addressEntity.cep,
          mask: "00000-000",
        ),
        streetFieldController = TextEditingController(
          text: arguments.providerEntity.addressEntity.street,
        ),
        neighborhoodFieldController = TextEditingController(
          text: arguments.providerEntity.addressEntity.neighborhood,
        ),
        cityFieldController = TextEditingController(
          text: arguments.providerEntity.addressEntity.city,
        ),
        stateFieldController = TextEditingController(
          text: arguments.providerEntity.addressEntity.state,
        ),
        notesFieldController =
            TextEditingController(text: arguments.providerEntity.notes),
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
      largeScreenWidget: ProviderEditLargeScreenPage(
        store: _store,
        id: _store.id.toString(),
        nameFieldController: nameFieldController,
        lastNameFieldController: lastNameFieldController,
        emailFieldController: emailFieldController,
        documentFieldController: documentNameFieldController,
        phoneFieldController: phoneFieldController,
        cepFieldController: cepFieldController,
        streetFieldController: streetFieldController,
        neighborhoodFieldController: neighborhoodFieldController,
        cityFieldController: cityFieldController,
        stateFieldController: stateFieldController,
        notesFieldController: notesFieldController,
        onPressedSaveButton: () => saveForm(context),
      ),
    );
  }
}
