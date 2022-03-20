import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/widgets/filter_form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class ProviderFilterSelectionLargeScreenPage extends StatelessWidget {
  final Function()? onPressedSaveButton;
  final TextEditingController idFieldController;
  final Function(String)? onChangedIdField;
  final TextEditingController nameFieldController;
  final Function(String)? onChangedNameField;

  ProviderFilterSelectionLargeScreenPage({
    Key? key,
    this.onPressedSaveButton,
    required this.idFieldController,
    required this.onChangedIdField,
    required this.nameFieldController,
    required this.onChangedNameField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterFormWidget(
      onPressedSaveButton: onPressedSaveButton,
      saveButtonLabel: "Aplicar Filtros",
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: UnderlinedTextField(
                label: "ID",
                controller: idFieldController,
                onChanged: onChangedIdField,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: UnderlinedTextField(
                label: "Nome",
                controller: nameFieldController,
                onChanged: onChangedNameField,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
