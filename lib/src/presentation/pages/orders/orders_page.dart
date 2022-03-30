import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/presentation/config/routes.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/orders/orders_large_screen_page.dart';
import 'package:frproteses/src/presentation/pages/orders/store/order_filter_store.dart';
import 'package:frproteses/src/presentation/pages/orders/store/orders_page_store.dart';
import 'package:frproteses/src/presentation/pages/orders/sub_pages/edit/order_edit_page.dart';
import 'package:frproteses/src/presentation/pages/orders/sub_pages/filter_selection/order_filter_selection_page.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class OrdersPage extends StatelessWidget {
  final NavigationStore _navigationStore = sl();
  final OrdersPageStore _store = OrdersPageStore(
    orderStore: sl(),
    filterStore: OrderFilterStore(),
  );

  OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreenWidget: OrdersLargeScreenPage(
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

    return _navigateToOrderEditPage(entity, isNew: true);
  }

  Future<void> _onPressedEdit(OrderEntity entity) async {
    return _navigateToOrderEditPage(entity);
  }

  Future<void> _onPressedFilters(BuildContext context) async {
    return _navigateToOrderFilterSelectionPage();
  }

  Future<void> _navigateToOrderEditPage(OrderEntity entity,
      {bool isNew = false}) async {
    final arguments = OrderEditPageArguments(orderEntity: entity, isNew: isNew);

    await _navigationStore.navigateTo(
      orderEditPageRoute,
      arguments: arguments,
    );

    _store.loadAll();
  }

  Future<void> _navigateToOrderFilterSelectionPage() async {
    final arguments = OrderFilterSelectionPageArguments(
      store: _store.filterStore,
    );

    return _navigationStore.navigateTo(
      orderFilterSelectionPageRoute,
      arguments: arguments,
    );
  }
}
