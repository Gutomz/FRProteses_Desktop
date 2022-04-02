import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/pages/products/store/product_filter_store.dart';
import 'package:frproteses/src/presentation/widgets/filter_form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class ProductFilterSelectionLargeScreenPage extends StatelessWidget {
  final ProductFilterStore store;
  final Function()? onPressedSaveButton;
  final TextEditingController idFieldController;
  final TextEditingController nameFieldController;
  final MoneyMaskedTextController priceFieldController;

  ProductFilterSelectionLargeScreenPage({
    Key? key,
    required this.store,
    this.onPressedSaveButton,
    required this.idFieldController,
    required this.nameFieldController,
    required this.priceFieldController,
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
                label: "Preço",
                controller: priceFieldController,
                onChanged: (_) =>
                    store.setPrice(priceFieldController.numberValue.toString()),
              ),
            ),
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              flex: 3,
              child: UnderlinedTextField(
                label: "Nome",
                controller: nameFieldController,
                onChanged: store.setName,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
