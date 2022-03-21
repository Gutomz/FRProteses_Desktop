import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/products/store/product_filter_store.dart';
import 'package:frproteses/src/presentation/pages/products/sub_pages/filter_selection/product_filter_selection_large_screen_page.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class ProductFilterSelectionPageArguments {
  final ProductFilterStore store;

  ProductFilterSelectionPageArguments({required this.store});
}

class ProductFilterSelectionPage extends StatelessWidget {
  final ProductFilterSelectionPageArguments arguments;
  final NavigationStore _navigationStore = sl();

  final TextEditingController idFieldController;
  final TextEditingController nameFieldController;
  final MoneyMaskedTextController priceFieldController;

  ProductFilterSelectionPage({Key? key, required this.arguments})
      : idFieldController = TextEditingController(text: arguments.store.id),
        nameFieldController = TextEditingController(text: arguments.store.name),
        priceFieldController = MoneyMaskedTextController(
            leftSymbol: "R\$ ",
            initialValue: num.tryParse(arguments.store.price)?.toDouble() ?? 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = arguments.store;
    return ResponsiveWidget(
      largeScreenWidget: ProductFilterSelectionLargeScreenPage(
        onPressedSaveButton: onPressedSaveButton,
        idFieldController: idFieldController,
        onChangedIdField: _store.setId,
        nameFieldController: nameFieldController,
        onChangedNameField: _store.setName,
        priceFieldController: priceFieldController,
        onChangedPriceField: (_) =>
            _store.setPrice(priceFieldController.numberValue.toString()),
      ),
    );
  }

  void onPressedSaveButton() {
    final _store = arguments.store;
    _store.saveFilters();
    _navigationStore.goBack();
  }
}
