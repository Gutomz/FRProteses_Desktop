import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/widgets/form_info_text_widget.dart';
import 'package:frproteses/src/presentation/widgets/id_text_widget.dart';

class FormWidget extends StatelessWidget {
  final String id;
  final String? status;
  final String saveButtonLabel;
  final Function()? onPressedSaveButton;
  final List<Widget> children;
  final List<Widget>? actions;

  FormWidget({
    Key? key,
    required this.id,
    this.status,
    required this.saveButtonLabel,
    this.onPressedSaveButton,
    required this.children,
    this.actions,
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
                Row(
                  children: [
                    IDTextWidget(id: id),
                    SizedBox(width: kFormHorizontalSpacing),
                    if (status != null)
                      FormInfoTextWidget(title: "Status", value: status!),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (actions != null) ...actions!,
                    SizedBox(width: kFormHorizontalSpacing),
                    OutlinedButton(
                      onPressed: onPressedSaveButton,
                      child: Text(saveButtonLabel),
                    ),
                  ],
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
