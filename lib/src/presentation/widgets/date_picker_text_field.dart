import 'package:flutter/material.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class DatePickerTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? errorText;
  final bool? enabled;
  final DateTime firstDate;
  final DateTime lastDate;

  DatePickerTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.onChanged,
    this.errorText,
    this.enabled,
    required this.firstDate,
    required this.lastDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnderlinedTextField(
      controller: controller,
      label: label,
      onChanged: onChanged,
      errorText: errorText,
      enabled: enabled,
      readOnly: true,
      onTap: () => pickDate(context),
      suffixIcon: IconButton(
        icon: Icon(Icons.calendar_month_rounded),
        onPressed: enabled == true ? () => pickDate(context) : null,
      ),
    );
  }

  Future<void> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: controller.text.toDateTime() ?? DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (date != null) {
      controller.text = date.formatDate();
      onChanged?.call(date.formatDate());
    }
  }
}
