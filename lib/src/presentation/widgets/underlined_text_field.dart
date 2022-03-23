import 'package:flutter/material.dart';

class UnderlinedTextField extends StatelessWidget {
  final bool? enabled;
  final String label;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final bool readOnly;

  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final Function(String)? onSubmitted;

  UnderlinedTextField({
    Key? key,
    this.enabled,
    required this.label,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.suffix,
    this.suffixIcon,
    this.textInputAction,
    this.onChanged,
    this.onEditingComplete,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      textCapitalization: textCapitalization,
      obscureText: obscureText,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      readOnly: readOnly,
      onTap: onTap,
      onSubmitted: onSubmitted,
      style: enabled != false
          ? null
          : Theme.of(context).textTheme.subtitle1?.copyWith(
                color:
                    Theme.of(context).textTheme.subtitle1?.color?.withAlpha(50),
              ),
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        labelStyle: TextStyle(
          color: enabled != false
              ? Theme.of(context).primaryColor
              : Theme.of(context).disabledColor,
        ),
        border: UnderlineInputBorder(),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).disabledColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).errorColor),
        ),
        suffix: suffix,
        fillColor: Colors.transparent,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

class UnderlinedPasswordTextField extends StatefulWidget {
  final bool? enabled;
  final String label;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final Color? iconColor;

  final Function(String)? onChanged;
  final Function()? onEditingComplete;

  const UnderlinedPasswordTextField({
    Key? key,
    this.enabled,
    required this.label,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.suffix,
    this.textInputAction,
    this.onChanged,
    this.onEditingComplete,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.iconColor,
  }) : super(key: key);

  @override
  _UnderlinedPasswordTextFieldState createState() =>
      _UnderlinedPasswordTextFieldState();
}

class _UnderlinedPasswordTextFieldState
    extends State<UnderlinedPasswordTextField> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return UnderlinedTextField(
      label: widget.label,
      enabled: widget.enabled,
      errorText: widget.errorText,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      suffix: widget.suffix,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      maxLength: widget.maxLength,
      textCapitalization: widget.textCapitalization,
      obscureText: !visible,
      suffixIcon: IconButton(
        onPressed: () => setState(() {
          visible = !visible;
        }),
        icon: Icon(
          visible ? Icons.visibility_off : Icons.visibility,
          color: widget.iconColor ?? Theme.of(context).disabledColor,
        ),
      ),
    );
  }
}
