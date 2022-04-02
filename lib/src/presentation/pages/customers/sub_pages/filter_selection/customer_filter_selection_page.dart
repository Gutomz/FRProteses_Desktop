import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/customers/store/customer_filter_store.dart';
import 'package:frproteses/src/presentation/pages/customers/sub_pages/filter_selection/customer_filter_selection_large_screen_page.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class CustomerFilterSelectionPageArguments {
  final CustomerFilterStore store;

  CustomerFilterSelectionPageArguments({required this.store});
}

class CustomerFilterSelectionPage extends StatelessWidget {
  final CustomerFilterSelectionPageArguments arguments;
  final NavigationStore _navigationStore = sl();

  final TextEditingController idFieldController;
  final TextEditingController nameFieldController;

  CustomerFilterSelectionPage({Key? key, required this.arguments})
      : idFieldController = TextEditingController(text: arguments.store.id),
        nameFieldController =
            TextEditingController(text: arguments.store.fullName),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreenWidget: CustomerFilterSelectionLargeScreenPage(
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
