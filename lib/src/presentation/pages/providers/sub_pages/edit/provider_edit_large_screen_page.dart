import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/pages/providers/sub_pages/edit/store/provider_edit_page_store.dart';
import 'package:frproteses/src/presentation/widgets/area_text_field.dart';
import 'package:frproteses/src/presentation/widgets/form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class ProviderEditLargeScreenPage extends StatelessWidget {
  final ProviderEditPageStore store;
  final String id;
  final TextEditingController nameFieldController;
  final TextEditingController lastNameFieldController;
  final TextEditingController emailFieldController;
  final TextEditingController documentFieldController;
  final TextEditingController phoneFieldController;
  final TextEditingController cepFieldController;
  final TextEditingController streetFieldController;
  final TextEditingController neighborhoodFieldController;
  final TextEditingController cityFieldController;
  final TextEditingController stateFieldController;
  final TextEditingController notesFieldController;
  final Function()? onPressedSaveButton;

  ProviderEditLargeScreenPage({
    Key? key,
    required this.store,
    required this.id,
    required this.nameFieldController,
    required this.lastNameFieldController,
    required this.emailFieldController,
    required this.documentFieldController,
    required this.phoneFieldController,
    required this.cepFieldController,
    required this.streetFieldController,
    required this.neighborhoodFieldController,
    required this.cityFieldController,
    required this.stateFieldController,
    required this.notesFieldController,
    this.onPressedSaveButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormWidget(
      id: id,
      saveButtonLabel: "Salvar",
      onPressedSaveButton: onPressedSaveButton,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Observer(builder: (_) {
                return UnderlinedTextField(
                  label: "Nome",
                  controller: nameFieldController,
                  onChanged: store.setName,
                  errorText: store.nameFieldErrorMessage,
                );
              }),
            ),
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              child: Observer(builder: (_) {
                return UnderlinedTextField(
                  label: "Sobrenome",
                  controller: lastNameFieldController,
                  onChanged: store.setLastName,
                  errorText: store.lastNameFieldErrorMessage,
                );
              }),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: Observer(builder: (_) {
                return UnderlinedTextField(
                  label: "E-mail",
                  controller: emailFieldController,
                  onChanged: store.setEmail,
                  errorText: store.emailFieldErrorMessage,
                );
              }),
            ),
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              child: Observer(builder: (_) {
                return UnderlinedTextField(
                  label: "CPF",
                  controller: documentFieldController,
                  onChanged: store.setDocument,
                  errorText: store.documentFieldErrorMessage,
                );
              }),
            ),
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              child: Observer(builder: (_) {
                return UnderlinedTextField(
                  label: "Telefone",
                  controller: phoneFieldController,
                  onChanged: store.setPhone,
                  errorText: store.phoneFieldErrorMessage,
                );
              }),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Observer(builder: (_) {
                return UnderlinedTextField(
                  label: "CEP",
                  controller: cepFieldController,
                  onChanged: store.setCep,
                  errorText: store.cepFieldErrorMessage,
                );
              }),
            ),
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              flex: 4,
              child: Observer(builder: (_) {
                return UnderlinedTextField(
                  label: "Endereço",
                  controller: streetFieldController,
                  onChanged: store.setStreet,
                  errorText: store.streetFieldErrorMessage,
                );
              }),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Observer(builder: (_) {
                return UnderlinedTextField(
                  label: "Bairro",
                  controller: neighborhoodFieldController,
                  onChanged: store.setNeighborhood,
                  errorText: store.neighborhoodFieldErrorMessage,
                );
              }),
            ),
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              child: Observer(builder: (_) {
                return UnderlinedTextField(
                  label: "Cidade",
                  controller: cityFieldController,
                  onChanged: store.setCity,
                  errorText: store.cityFieldErrorMessage,
                );
              }),
            ),
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              child: Observer(builder: (_) {
                return UnderlinedTextField(
                  label: "Estado",
                  controller: stateFieldController,
                  onChanged: store.setState,
                  errorText: store.stateFieldErrorMessage,
                );
              }),
            ),
          ],
        ),
        Observer(builder: (_) {
          return AreaTextField(
            label: "Observações",
            controller: notesFieldController,
            onChanged: store.setNotes,
            errorText: store.notesFieldErrorMessage,
          );
        }),
      ],
    );
  }
}
