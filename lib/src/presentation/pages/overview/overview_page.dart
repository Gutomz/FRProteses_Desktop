import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';
import 'package:frproteses/src/presentation/helpers/printing.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/overview/overview_large_screen_page.dart';
import 'package:frproteses/src/presentation/pages/overview/store/overview_page_store.dart';

class OverviewPage extends StatelessWidget {
  final OverviewPageStore _store;
  final TextEditingController customerFieldController;

  OverviewPage({Key? key})
      : _store = OverviewPageStore(bankAccountStore: sl()),
        customerFieldController = TextEditingController(),
        super(key: key);

  Future<void> _onPressedPrint(
    BuildContext context,
    BankAccountEntity bankAccountEntity,
  ) async {
    final printed =
        await showCustomerExtractPrintPreview(context, bankAccountEntity);

    if (printed == true) {
      await _store.bankAccountStore.report(bankAccountEntity.customerEntity.id);
      _store.updateBankAccount(bankAccountEntity.customerEntity.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreenWidget: OverviewLargeScreenPage(
        store: _store,
        onPressedPrint: _onPressedPrint,
        customerFieldController: customerFieldController,
      ),
    );
  }
}
