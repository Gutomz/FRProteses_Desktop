import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/widgets/form_info_text_widget.dart';

class IDTextWidget extends StatelessWidget {
  final String id;

  const IDTextWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormInfoTextWidget(title: "ID", value: id.padLeft(4, "0"));
  }
}
