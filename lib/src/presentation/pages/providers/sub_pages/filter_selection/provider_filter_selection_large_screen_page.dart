import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/pages/providers/store/provider_filter_store.dart';
import 'package:frproteses/src/presentation/widgets/filter_form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class ProviderFilterSelectionLargeScreenPage extends StatelessWidget {
  final ProviderFilterStore store;
  final Function()? onPressedSaveButton;
  final TextEditingController idFieldController;
  final TextEditingController nameFieldController;

  ProviderFilterSelectionLargeScreenPage({
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
