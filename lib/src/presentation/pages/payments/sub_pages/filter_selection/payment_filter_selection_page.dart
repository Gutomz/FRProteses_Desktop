import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/payments/store/payment_filter_store.dart';
import 'package:frproteses/src/presentation/pages/payments/sub_pages/filter_selection/payment_filter_selection_large_screen_page.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class PaymentFilterSelectionPageArguments {
  final PaymentFilterStore store;

  PaymentFilterSelectionPageArguments({required this.store});
}

class PaymentFilterSelectionPage extends StatelessWidget {
  final PaymentFilterSelectionPageArguments arguments;
  final NavigationStore _navigationStore = sl();

  final TextEditingController idFieldController;
  final TextEditingController customerFieldController;
  final TextEditingController dateRangeFieldController;
  final TextEditingController paymentMethodFieldController;
  final MoneyMaskedTextController paidValueFieldController;

  PaymentFilterSelectionPage({Key? key, required this.arguments})
      : idFieldController = TextEditingController(text: arguments.store.id),
        customerFieldController =
            TextEditingController(text: arguments.store.customer),
        dateRangeFieldController =
            TextEditingController(text: arguments.store.dateRange),
        paymentMethodFieldController =
            TextEditingController(text: arguments.store.paymentMethod?.title),
        paidValueFieldController = MoneyMaskedTextController(
            leftSymbol: "R\$ ",
            initialValue:
                num.tryParse(arguments.store.paidValue)?.toDouble() ?? 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = arguments.store;
    return ResponsiveWidget(
      largeScreenWidget: PaymentFilterSelectionLargeScreenPage(
        onPressedSaveButton: onPressedSaveButton,
        idFieldController: idFieldController,
        onChangedIdField: _store.setId,
        customerFieldController: customerFieldController,
        onChangedCustomerField: _store.setCustomer,
        dateRangeFieldController: dateRangeFieldController,
        onChangedDateRangeField: _store.setDateRange,
        paymentMethodFieldController: paymentMethodFieldController,
        onChangedPaymentMethodField: _store.setPaymentMethod,
        paidValueFieldController: paidValueFieldController,
        onChangedPaidValueField: (_) => _store
            .setPaidValue(paidValueFieldController.numberValue.toString()),
      ),
    );
  }

  void onPressedSaveButton() {
    final _store = arguments.store;
    _store.saveFilters();
    _navigationStore.goBack();
  }
}
