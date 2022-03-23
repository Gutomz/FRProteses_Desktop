import 'package:flutter/material.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class DateRangePickerTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? errorText;
  final bool? enabled;
  final DateTime firstDate;
  final DateTime lastDate;

  DateRangePickerTextField({
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
    final start = (await showDatePicker(
          context: context,
          fieldLabelText: "Data Inicial",
          helpText: "Data Inicial",
          initialDate: controller.text.toDateTimeRange()?.start ?? firstDate,
          firstDate: firstDate,
          lastDate: lastDate,
          initialEntryMode: DatePickerEntryMode.input,
        )) ??
        firstDate;

    final end = (await showDatePicker(
          context: context,
          fieldLabelText: "Data Final",
          helpText: "Data Final",
          initialDate: controller.text.toDateTimeRange()?.end ?? DateTime.now(),
          firstDate: firstDate,
          lastDate: lastDate,
          initialEntryMode: DatePickerEntryMode.input,
        )) ??
        lastDate;

    final range = DateTimeRange(start: start, end: end);

    controller.text = range.formatDate();
    onChanged?.call(range.formatDate());
  }
}
