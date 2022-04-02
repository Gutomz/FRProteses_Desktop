import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/providers/store/provider_filter_store.dart';
import 'package:frproteses/src/presentation/pages/providers/sub_pages/filter_selection/provider_filter_selection_large_screen_page.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class ProviderFilterSelectionPageArguments {
  final ProviderFilterStore store;

  ProviderFilterSelectionPageArguments({required this.store});
}

class ProviderFilterSelectionPage extends StatelessWidget {
  final ProviderFilterSelectionPageArguments arguments;
  final NavigationStore _navigationStore = sl();

  final TextEditingController idFieldController;
  final TextEditingController nameFieldController;

  ProviderFilterSelectionPage({Key? key, required this.arguments})
      : idFieldController = TextEditingController(text: arguments.store.id),
        nameFieldController =
            TextEditingController(text: arguments.store.fullName),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreenWidget: ProviderFilterSelectionLargeScreenPage(
        store: arguments.store,
        onPressedSaveButton: onPressedSaveButton,
        idFieldController: idFieldController,
        nameFieldController: nameFieldController,
      ),
    );
  }

  void onPressedSaveButton() {
    final _store = arguments.store;
    _store.saveFilters();
    _navigationStore.goBack();
  }
}
