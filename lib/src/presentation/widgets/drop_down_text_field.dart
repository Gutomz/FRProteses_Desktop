import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class DropDownTextField<T> extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final List<T> data;
  final String Function(T) buildMenuItemText;
  final Function(T?)? onChanged;
  final String? errorText;
  final bool? enabled;

  DropDownTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.data,
    required this.buildMenuItemText,
    this.onChanged,
    this.errorText,
    this.enabled,
  }) : super(key: key);

  @override
  State<DropDownTextField<T>> createState() => _DropDownTextFieldState<T>();
}

class _DropDownTextFieldState<T> extends State<DropDownTextField<T>> {
  final GlobalKey<PopupMenuButtonState> menuKey = GlobalKey();

  List<T> data = List.empty();

  @override
  void initState() {
    super.initState();

    setState(() {
      data = widget.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UnderlinedTextField(
      label: widget.label,
      controller: widget.controller,
      errorText: widget.errorText,
      onChanged: _onChangedSearch,
      onSubmitted: _onSubmittedSearch,
      enabled: widget.enabled,
      suffixIcon: PopupMenuButton<T>(
        key: menuKey,
        icon: Icon(Icons.arrow_drop_down),
        itemBuilder: _getItems,
        onSelected: _onSelected,
        onCanceled: _onCanceled,
        position: PopupMenuPosition.under,
        enabled: widget.enabled ?? true,
      ),
    );
  }

  List<PopupMenuEntry<T>> _getItems(BuildContext context) {
    return data
        .map((e) => PopupMenuItem<T>(
            value: e, child: Text(widget.buildMenuItemText(e))))
        .toList();
  }

  void _onSelected(T e) {
    if (e != null) {
      widget.controller.text = widget.buildMenuItemText(e);
    }

    widget.onChanged?.call(e);
  }

  void _onCanceled() {
    widget.controller.text = "";
    widget.onChanged?.call(null);
  }

  void _onChangedSearch(String str) {
    setState(() {
      data = widget.data
          .where((element) =>
              element == null ||
              widget
                  .buildMenuItemText(element)
                  .toLowerCase()
                  .contains(str.toLowerCase()))
          .toList();
    });
  }

  void _onSubmittedSearch(String str) {
    _onChangedSearch(str);

    menuKey.currentState?.showButtonMenu();
  }
}
