import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/core/enums/order_status_type.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/orders/store/order_filter_store.dart';
import 'package:frproteses/src/presentation/pages/orders/sub_pages/filter_selection/order_filter_selection_large_screen_page.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class OrderFilterSelectionPageArguments {
  final OrderFilterStore store;

  OrderFilterSelectionPageArguments({required this.store});
}

class OrderFilterSelectionPage extends StatelessWidget {
  final NavigationStore _navigationStore = sl();
  final OrderFilterSelectionPageArguments arguments;

  final TextEditingController idFieldController;
  final TextEditingController statusFieldController;
  final MoneyMaskedTextController totalPriceFieldController;
  final TextEditingController orderDateRangeFieldController;
  final TextEditingController customerFieldController;
  final TextEditingController deliveryDateRangeFieldController;

  OrderFilterSelectionPage({Key? key, required this.arguments})
      : idFieldController = TextEditingController(text: arguments.store.id),
        statusFieldController =
            TextEditingController(text: arguments.store.status?.title),
        totalPriceFieldController = MoneyMaskedTextController(
            leftSymbol: "R\$ ",
            initialValue:
                num.tryParse(arguments.store.totalPriceValue)?.toDouble() ?? 0),
        orderDateRangeFieldController =
            TextEditingController(text: arguments.store.orderDateRange),
        customerFieldController =
            TextEditingController(text: arguments.store.customer),
        deliveryDateRangeFieldController =
            TextEditingController(text: arguments.store.deliveryDateRange),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = arguments.store;
    return ResponsiveWidget(
      largeScreenWidget: OrderFilterSelectionLargeScreenPage(
        store: _store,
        onPressedSaveButton: onPressedSaveButton,
        idFieldController: idFieldController,
        statusFieldController: statusFieldController,
        totalPriceFieldController: totalPriceFieldController,
        orderDateRangeFieldController: orderDateRangeFieldController,
        customerFieldController: customerFieldController,
        deliveryDateRangeFieldController: deliveryDateRangeFieldController,
      ),
    );
  }

  void onPressedSaveButton() {
    final _store = arguments.store;
    _store.saveFilters();
    _navigationStore.goBack();
  }
}
