import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/presentation/config/routes.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/customers/customers_large_screen_page.dart';
import 'package:frproteses/src/presentation/pages/customers/store/customer_filter_store.dart';
import 'package:frproteses/src/presentation/pages/customers/store/customers_page_store.dart';
import 'package:frproteses/src/presentation/pages/customers/sub_pages/edit/customer_edit_page.dart';
import 'package:frproteses/src/presentation/pages/customers/sub_pages/filter_selection/customer_filter_selection_page.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class CustomersPage extends StatelessWidget {
  final NavigationStore _navigationStore = sl();
  final CustomersPageStore _store = CustomersPageStore(
    customerStore: sl(),
    filterStore: CustomerFilterStore(),
  );

  CustomersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ResponsiveWidget(
          largeScreenWidget: CustomersLargeScreenPage(
            store: _store,
            onPressedCreate: _onPressedCreate,
            onPressedEdit: _onPressedEdit,
            onPressedFilters: () => _onPressedFilters(context),
          ),
        ),
      ],
    );
  }

  Future<void> _onPressedCreate() async {
    final entity = await _store.createNew();

    if (entity == null) {
      // TODO - Show error message
      return;
    }

    return _navigateToCustomerEditPage(entity, isNew: true);
  }

  Future<void> _onPressedEdit(CustomerEntity entity) async {
    return _navigateToCustomerEditPage(entity);
  }

  Future<void> _onPressedFilters(BuildContext context) async {
    return _navigateToCustomerFilterSelectionPage();
  }

  Future<void> _navigateToCustomerEditPage(CustomerEntity entity,
      {bool isNew = false}) async {
    final arguments =
        CustomerEditPageArguments(customerEntity: entity, isNew: isNew);

    await _navigationStore.navigateTo(
      customerEditPageRoute,
      arguments: arguments,
    );

    _store.loadAll();
  }

  Future<void> _navigateToCustomerFilterSelectionPage() async {
    final arguments = CustomerFilterSelectionPageArguments(
      store: _store.filterStore,
    );

    return _navigationStore.navigateTo(
      customerFilterSelectionPageRoute,
      arguments: arguments,
    );
  }
}
