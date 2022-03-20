import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/presentation/config/routes.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/providers/providers_large_screen_page.dart';
import 'package:frproteses/src/presentation/pages/providers/store/provider_filter_store.dart';
import 'package:frproteses/src/presentation/pages/providers/store/providers_page_store.dart';
import 'package:frproteses/src/presentation/pages/providers/sub_pages/edit/provider_edit_page.dart';
import 'package:frproteses/src/presentation/pages/providers/sub_pages/filter_selection/provider_filter_selection_page.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class ProvidersPage extends StatelessWidget {
  final NavigationStore _navigationStore = sl();
  final ProvidersPageStore _store = ProvidersPageStore(
    providerStore: sl(),
    filterStore: ProviderFilterStore(),
  );

  ProvidersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreenWidget: ProvidersLargeScreenPage(
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

    return _navigateToProviderEditPage(entity, isNew: true);
  }

  Future<void> _onPressedEdit(ProviderEntity entity) async {
    return _navigateToProviderEditPage(entity);
  }

  Future<void> _onPressedFilters(BuildContext context) async {
    return _navigateToProviderFilterSelectionPage();
  }

  Future<void> _navigateToProviderEditPage(ProviderEntity entity,
      {bool isNew = false}) async {
    final arguments =
        ProviderEditPageArguments(providerEntity: entity, isNew: isNew);

    await _navigationStore.navigateTo(
      providerEditPageRoute,
      arguments: arguments,
    );

    _store.loadAll();
  }

  Future<void> _navigateToProviderFilterSelectionPage() async {
    final arguments = ProviderFilterSelectionPageArguments(
      store: _store.filterStore,
    );

    return _navigationStore.navigateTo(
      providerFilterSelectionPageRoute,
      arguments: arguments,
    );
  }
}
