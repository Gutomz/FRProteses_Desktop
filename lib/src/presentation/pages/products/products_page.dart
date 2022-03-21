import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/presentation/config/routes.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/products/products_large_screen_page.dart';
import 'package:frproteses/src/presentation/pages/products/store/product_filter_store.dart';
import 'package:frproteses/src/presentation/pages/products/store/products_page_store.dart';
import 'package:frproteses/src/presentation/pages/products/sub_pages/edit/product_edit_page.dart';
import 'package:frproteses/src/presentation/pages/products/sub_pages/filter_selection/product_filter_selection_page.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class ProductsPage extends StatelessWidget {
  final NavigationStore _navigationStore = sl();
  final ProductsPageStore _store = ProductsPageStore(
    productStore: sl(),
    filterStore: ProductFilterStore(),
  );

  ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreenWidget: ProductsLargeScreenPage(
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

    return _navigateToProductEditPage(entity, isNew: true);
  }

  Future<void> _onPressedEdit(ProductEntity entity) async {
    return _navigateToProductEditPage(entity);
  }

  Future<void> _onPressedFilters(BuildContext context) async {
    return _navigateToProductFilterSelectionPage();
  }

  Future<void> _navigateToProductEditPage(ProductEntity entity,
      {bool isNew = false}) async {
    final arguments =
        ProductEditPageArguments(productEntity: entity, isNew: isNew);

    await _navigationStore.navigateTo(
      productEditPageRoute,
      arguments: arguments,
    );

    _store.loadAll();
  }

  Future<void> _navigateToProductFilterSelectionPage() async {
    final arguments = ProductFilterSelectionPageArguments(
      store: _store.filterStore,
    );

    return _navigationStore.navigateTo(
      productFilterSelectionPageRoute,
      arguments: arguments,
    );
  }
}
