import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/config/constants.dart';

class FilterFormWidget extends StatelessWidget {
  final String saveButtonLabel;
  final Function()? onPressedSaveButton;
  final List<Widget> children;

  FilterFormWidget({
    Key? key,
    required this.saveButtonLabel,
    this.onPressedSaveButton,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: onPressedSaveButton,
                  child: Text(saveButtonLabel),
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
