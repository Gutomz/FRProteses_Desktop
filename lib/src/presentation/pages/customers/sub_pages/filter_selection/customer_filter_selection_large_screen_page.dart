import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/pages/customers/store/customer_filter_store.dart';
import 'package:frproteses/src/presentation/widgets/filter_form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class CustomerFilterSelectionLargeScreenPage extends StatelessWidget {
  final CustomerFilterStore store;
  final Function()? onPressedSaveButton;
  final TextEditingController idFieldController;
  final TextEditingController nameFieldController;

  const CustomerFilterSelectionLargeScreenPage({
    Key? key,
    required this.store,
    this.onPressedSaveButton,
    required this.idFieldController,
    required this.nameFieldController,
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
                onChanged: store.setId,
              ),
            ),
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              child: UnderlinedTextField(
                label: "Nome",
                controller: nameFieldController,
                onChanged: store.setFullName,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
