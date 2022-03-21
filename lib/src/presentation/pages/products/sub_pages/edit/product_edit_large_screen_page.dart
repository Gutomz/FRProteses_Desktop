import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/widgets/form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class ProductEditLargeScreenPage extends StatelessWidget {
  final String id;
  final Function()? onPressedSaveButton;
  final TextEditingController nameFieldController;
  final Function(String)? onChangedNameField;
  final String? nameFieldErrorText;
  final TextEditingController priceFieldController;
  final Function(String)? onChangedPriceField;
  final String? priceFieldErrorText;

  ProductEditLargeScreenPage({
    Key? key,
    required this.id,
    this.onPressedSaveButton,
    required this.nameFieldController,
    required this.onChangedNameField,
    required this.nameFieldErrorText,
    required this.priceFieldController,
    required this.onChangedPriceField,
    required this.priceFieldErrorText,
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
                label: "Preço",
                controller: priceFieldController,
                onChanged: onChangedPriceField,
                errorText: priceFieldErrorText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
