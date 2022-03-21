import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/widgets/filter_form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class ProductFilterSelectionLargeScreenPage extends StatelessWidget {
  final Function()? onPressedSaveButton;
  final TextEditingController idFieldController;
  final Function(String)? onChangedIdField;
  final TextEditingController nameFieldController;
  final Function(String)? onChangedNameField;
  final TextEditingController priceFieldController;
  final Function(String)? onChangedPriceField;

  ProductFilterSelectionLargeScreenPage({
    Key? key,
    this.onPressedSaveButton,
    required this.idFieldController,
    required this.onChangedIdField,
    required this.nameFieldController,
    required this.onChangedNameField,
    required this.priceFieldController,
    required this.onChangedPriceField,
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
                label: "Preço",
                controller: priceFieldController,
                onChanged: onChangedPriceField,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              flex: 3,
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
