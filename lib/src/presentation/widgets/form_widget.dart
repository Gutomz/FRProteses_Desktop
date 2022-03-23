import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/widgets/id_text_widget.dart';

class FormWidget extends StatelessWidget {
  final String id;
  final String saveButtonLabel;
  final Function()? onPressedSaveButton;
  final List<Widget> children;

  FormWidget({
    Key? key,
    required this.id,
    required this.saveButtonLabel,
    this.onPressedSaveButton,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(kCardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IDTextWidget(id: id),
                OutlinedButton(
                  onPressed: onPressedSaveButton,
                  child: Text(saveButtonLabel),
                ),
              ],
            ),
            SizedBox(height: kFormLineSpacing),
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
