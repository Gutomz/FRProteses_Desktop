import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/products/sub_pages/edit/product_edit_large_screen_page.dart';
import 'package:frproteses/src/presentation/pages/products/sub_pages/edit/store/product_edit_page_store.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class ProductEditPageArguments {
  final ProductEntity productEntity;
  final bool isNew;

  ProductEditPageArguments({required this.productEntity, this.isNew = false});
}

class ProductEditPage extends StatelessWidget {
  final ProductEditPageStore _store;
  final NavigationStore _navigationStore = sl();

  final ProductEditPageArguments arguments;

  final TextEditingController nameFieldController;
  final MoneyMaskedTextController priceFieldController;

  ProductEditPage({Key? key, required this.arguments})
      : _store = ProductEditPageStore(
          arguments.productEntity,
          productStore: sl(),
        ),
        nameFieldController =
            TextEditingController(text: arguments.productEntity.name),
        priceFieldController = MoneyMaskedTextController(
            leftSymbol: "R\$ ", initialValue: arguments.productEntity.price),
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
      largeScreenWidget: Observer(
        builder: (context) {
          return ProductEditLargeScreenPage(
            id: _store.id.toString(),
            nameFieldController: nameFieldController,
            onChangedNameField: _store.setName,
            nameFieldErrorText: _store.nameFieldErrorMessage,
            priceFieldController: priceFieldController,
            onChangedPriceField: (_) =>
                _store.setPrice(priceFieldController.numberValue.toString()),
            priceFieldErrorText: _store.priceFieldErrorMessage,
            onPressedSaveButton: () => saveForm(context),
          );
        },
      ),
    );
  }
}
