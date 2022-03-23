import 'package:flutter/material.dart';

class AreaTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? errorText;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? enabled;

  AreaTextField({
    Key? key,
    required this.label,
    this.errorText,
    this.controller,
    this.onChanged,
    this.minLines = 5,
    this.maxLines = 7,
    this.maxLength = 5000,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
        border: OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
