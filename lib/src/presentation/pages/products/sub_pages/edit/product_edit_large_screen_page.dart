import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/pages/products/sub_pages/edit/store/product_edit_page_store.dart';
import 'package:frproteses/src/presentation/widgets/form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class ProductEditLargeScreenPage extends StatelessWidget {
  final ProductEditPageStore store;
  final String id;
  final Function()? onPressedSaveButton;
  final TextEditingController nameFieldController;
  final MoneyMaskedTextController priceFieldController;

  ProductEditLargeScreenPage({
    Key? key,
    required this.store,
    required this.id,
    this.onPressedSaveButton,
    required this.nameFieldController,
    required this.priceFieldController,
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
                  label: "Preço",
                  controller: priceFieldController,
                  onChanged: (_) => store
                      .setPrice(priceFieldController.numberValue.toString()),
                  errorText: store.priceFieldErrorMessage,
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}
