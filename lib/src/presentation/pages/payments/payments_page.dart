import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';
import 'package:frproteses/src/presentation/config/routes.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/payments/payments_large_screen_page.dart';
import 'package:frproteses/src/presentation/pages/payments/store/payment_filter_store.dart';
import 'package:frproteses/src/presentation/pages/payments/store/payments_page_store.dart';
import 'package:frproteses/src/presentation/pages/payments/sub_pages/edit/payment_edit_page.dart';
import 'package:frproteses/src/presentation/pages/payments/sub_pages/filter_selection/payment_filter_selection_page.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class PaymentsPage extends StatelessWidget {
  final NavigationStore _navigationStore = sl();
  final PaymentsPageStore _store = PaymentsPageStore(
    paymentStore: sl(),
    filterStore: PaymentFilterStore(),
  );

  PaymentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreenWidget: PaymentsLargeScreenPage(
        store: _store,
        onPressedCreate: _onPressedCreate,
        onPressedEdit: _onPressedEdit,
        onPressedFilters: () => _onPressedFilters(context),
      ),
    );
  }

  Future<void> _onPressedCreate() async {
    final entity = await _store.createNew();

    if (entity == null) {
      // TODO - Show error message
      return;
    }

    return _navigateToPaymentEditPage(entity, isNew: true);
  }

  Future<void> _onPressedEdit(PaymentEntity entity) async {
    return _navigateToPaymentEditPage(entity);
  }

  Future<void> _onPressedFilters(BuildContext context) async {
    return _navigateToPaymentFilterSelectionPage();
  }

  Future<void> _navigateToPaymentEditPage(PaymentEntity entity,
      {bool isNew = false}) async {
    final arguments =
        PaymentEditPageArguments(paymentEntity: entity, isNew: isNew);

    await _navigationStore.navigateTo(
      paymentEditPageRoute,
      arguments: arguments,
    );

    _store.loadAll();
  }

  Future<void> _navigateToPaymentFilterSelectionPage() async {
    final arguments = PaymentFilterSelectionPageArguments(
      store: _store.filterStore,
    );

    return _navigationStore.navigateTo(
      paymentFilterSelectionPageRoute,
      arguments: arguments,
    );
  }
}
