import 'package:flutter/material.dart';

class SimpleConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? rejectText;
  final String acceptText;
  final bool invertColors;

  const SimpleConfirmDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.acceptText,
    this.rejectText,
    this.invertColors = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
      content: Text(content, style: TextStyle(fontSize: 14)),
      actions: [
        if (rejectText != null)
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: invertColors
                  ? null
                  : MaterialStateProperty.all(Theme.of(context).errorColor),
            ),
            child: Text(rejectText!),
          ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ButtonStyle(
            backgroundColor: invertColors
                ? MaterialStateProperty.all(Theme.of(context).errorColor)
                : null,
          ),
          child: Text(acceptText),
        ),
      ],
    );
  }
}
