import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/settings/settings_large_screen_page.dart';
import 'package:frproteses/src/presentation/pages/settings/store/settings_page_store.dart';
import 'package:frproteses/src/presentation/widgets/simple_confirm_dialog.dart';

class SettingsPage extends StatelessWidget {
  final SettingsPageStore _store;

  SettingsPage({
    Key? key,
  })  : _store = SettingsPageStore(settingsStore: sl()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreenWidget: SettingsLargeScreenPage(
        onPressedClearDatabase: onPressedClearDatabase,
      ),
    );
  }

  Future<void> onPressedClearDatabase(BuildContext context) async {
    final answer = await showDialog<bool>(
      context: context,
      builder: (context) => SimpleConfirmDialog(
        title: "Apagar Dados?",
        content:
            "Caso aceite todos os dados do aplicativo serão removidos, e não terá como recuperar!",
        acceptText: "Aceitar",
        rejectText: "Cancelar",
        invertColors: true,
      ),
    );

    if (answer == true) {
      await _store.clear();

      if (!_store.hasError) {
        showDialog(
          context: context,
          builder: (context) => SimpleConfirmDialog(
            title: "Dados Apagados!",
            content: "Todos os dados foram removidos com sucesso!",
            acceptText: "Ok",
          ),
        );
      }
    }
  }
}
