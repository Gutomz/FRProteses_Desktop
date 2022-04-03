import 'package:flutter/material.dart';

class SettingsLargeScreenPage extends StatelessWidget {
  final Function(BuildContext context)? onPressedClearDatabase;

  SettingsLargeScreenPage({
    Key? key,
    this.onPressedClearDatabase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gostaria de apagar todos os dados?",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  OutlinedButton(
                    onPressed: () => onPressedClearDatabase?.call(context),
                    child: Text("Apagar Dados"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
