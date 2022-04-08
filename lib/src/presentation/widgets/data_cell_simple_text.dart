import 'package:flutter/material.dart';

class DataCellSimpleText extends StatelessWidget {
  final String? text;
  DataCellSimpleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = (text?.isNotEmpty == true ? text : "-") ?? "-";

    if (text?.isNotEmpty == true) {
      return Tooltip(
        message: value,
        child: Text(
          value,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return Text(
      value,
      overflow: TextOverflow.ellipsis,
    );
  }
}
