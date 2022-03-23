import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/widgets/area_text_field.dart';
import 'package:frproteses/src/presentation/widgets/form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class ProviderEditLargeScreenPage extends StatelessWidget {
  final String id;
  final TextEditingController nameFieldController;
  final Function(String)? onChangedNameField;
  final String? nameFieldErrorText;
  final TextEditingController lastNameFieldController;
  final Function(String)? onChangedLastNameField;
  final String? lastNameFieldErrorText;
  final TextEditingController emailFieldController;
  final Function(String)? onChangedEmailField;
  final String? emailFieldErrorText;
  final TextEditingController documentFieldController;
  final Function(String)? onChangedDocumentField;
  final String? documentFieldErrorText;
  final TextEditingController phoneFieldController;
  final Function(String)? onChangedPhoneField;
  final String? phoneFieldErrorText;
  final TextEditingController cepFieldController;
  final Function(String)? onChangedCepField;
  final String? cepFieldErrorText;
  final TextEditingController streetFieldController;
  final Function(String)? onChangedStreetField;
  final String? streetFieldErrorText;
  final TextEditingController neighborhoodFieldController;
  final Function(String)? onChangedNeighborhoodField;
  final String? neighborhoodFieldErrorText;
  final TextEditingController cityFieldController;
  final Function(String)? onChangedCityField;
  final String? cityFieldErrorText;
  final TextEditingController stateFieldController;
  final Function(String)? onChangedStateField;
  final String? stateFieldErrorText;
  final TextEditingController notesFieldController;
  final Function(String)? onChangedNotesField;
  final String? notesFieldErrorText;
  final Function()? onPressedSaveButton;

  ProviderEditLargeScreenPage({
    Key? key,
    required this.id,
    required this.nameFieldController,
    required this.onChangedNameField,
    required this.nameFieldErrorText,
    required this.lastNameFieldController,
    required this.onChangedLastNameField,
    required this.lastNameFieldErrorText,
    required this.emailFieldController,
    required this.onChangedEmailField,
    required this.emailFieldErrorText,
    required this.documentFieldController,
    required this.onChangedDocumentField,
    required this.documentFieldErrorText,
    required this.phoneFieldController,
    required this.onChangedPhoneField,
    required this.phoneFieldErrorText,
    required this.cepFieldController,
    required this.onChangedCepField,
    required this.cepFieldErrorText,
    required this.streetFieldController,
    required this.onChangedStreetField,
    required this.streetFieldErrorText,
    required this.neighborhoodFieldController,
    required this.onChangedNeighborhoodField,
    required this.neighborhoodFieldErrorText,
    required this.cityFieldController,
    required this.onChangedCityField,
    required this.cityFieldErrorText,
    required this.stateFieldController,
    required this.onChangedStateField,
    required this.stateFieldErrorText,
    required this.notesFieldController,
    required this.onChangedNotesField,
    required this.notesFieldErrorText,
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
              child: UnderlinedTextField(
                label: "Nome",
                controller: nameFieldController,
                onChanged: onChangedNameField,
                errorText: nameFieldErrorText,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: UnderlinedTextField(
                label: "Sobrenome",
                controller: lastNameFieldController,
                onChanged: onChangedLastNameField,
                errorText: lastNameFieldErrorText,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: UnderlinedTextField(
                label: "E-mail",
                controller: emailFieldController,
                onChanged: onChangedEmailField,
                errorText: emailFieldErrorText,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: UnderlinedTextField(
                label: "CPF",
                controller: documentFieldController,
                onChanged: onChangedDocumentField,
                errorText: documentFieldErrorText,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: UnderlinedTextField(
                label: "Telefone",
                controller: phoneFieldController,
                onChanged: onChangedPhoneField,
                errorText: phoneFieldErrorText,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: UnderlinedTextField(
                label: "CEP",
                controller: cepFieldController,
                onChanged: onChangedCepField,
                errorText: cepFieldErrorText,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              flex: 4,
              child: UnderlinedTextField(
                label: "Endereço",
                controller: streetFieldController,
                onChanged: onChangedStreetField,
                errorText: streetFieldErrorText,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: UnderlinedTextField(
                label: "Bairro",
                controller: neighborhoodFieldController,
                onChanged: onChangedNeighborhoodField,
                errorText: neighborhoodFieldErrorText,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: UnderlinedTextField(
                label: "Cidade",
                controller: cityFieldController,
                onChanged: onChangedCityField,
                errorText: cityFieldErrorText,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: UnderlinedTextField(
                label: "Estado",
                controller: stateFieldController,
                onChanged: onChangedStateField,
                errorText: stateFieldErrorText,
              ),
            ),
          ],
        ),
        AreaTextField(
          label: "Observações",
          controller: notesFieldController,
          onChanged: onChangedNotesField,
          errorText: notesFieldErrorText,
        ),
      ],
    );
  }
}
