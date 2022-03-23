import 'package:flutter/material.dart';

class TeethWidget extends StatefulWidget {
  final String title;
  final bool? value;
  final Function(bool?)? onChanged;
  final bool isBottom;
  final bool? enabled;

  const TeethWidget({
    Key? key,
    required this.title,
    required this.value,
    this.onChanged,
    this.isBottom = false,
    this.enabled,
  }) : super(key: key);

  @override
  State<TeethWidget> createState() => _TeethWidgetState();
}

class _TeethWidgetState extends State<TeethWidget> {
  bool? _value;

  @override
  void initState() {
    super.initState();

    setState(() {
      _value = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!widget.isBottom) Text(widget.title),
        Checkbox(
          value: _value,
          onChanged: widget.enabled == true ? _onChanged : null,
          visualDensity: VisualDensity.compact,
        ),
        if (widget.isBottom) Text(widget.title),
      ],
    );
  }

  void _onChanged(bool? newValue) {
    setState(() {
      _value = newValue;
    });
    widget.onChanged?.call(newValue);
  }
}
