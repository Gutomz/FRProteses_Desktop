import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frproteses/src/presentation/config/extensions.dart';

class NumericUpDownTextField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int min;
  final int max;
  final int step;
  final double arrowsWidth;
  final double arrowsHeight;
  final EdgeInsets contentPadding;
  final double borderWidth;
  final ValueChanged<int?>? onChanged;
  final bool? enabled;

  const NumericUpDownTextField({
    Key? key,
    this.label,
    this.controller,
    this.focusNode,
    this.min = 0,
    this.max = 999,
    this.step = 1,
    this.arrowsWidth = 24,
    this.arrowsHeight = kMinInteractiveDimension,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.borderWidth = 2,
    this.onChanged,
    this.enabled,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NumericUpDownTextFieldState();
}

class _NumericUpDownTextFieldState extends State<NumericUpDownTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _canGoUp = false;
  bool _canGoDown = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _updateArrows(int.tryParse(_controller.text));
  }

  @override
  void didUpdateWidget(covariant NumericUpDownTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller = widget.controller ?? _controller;
    _focusNode = widget.focusNode ?? _focusNode;
    _updateArrows(int.tryParse(_controller.text));
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: _controller,
        focusNode: _focusNode,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        maxLength:
            widget.max.toString().length + (widget.min.isNegative ? 1 : 0),
        onTap: widget.enabled == true ? _controller.selectAll : null,
        enabled: widget.enabled,
        decoration: InputDecoration(
          counterText: '',
          label: widget.label != null ? Text(widget.label!) : null,
          labelStyle: TextStyle(
            color: widget.enabled != false
                ? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor,
          ),
          suffixIconConstraints: BoxConstraints(
              maxHeight: widget.arrowsHeight,
              maxWidth: widget.arrowsWidth + widget.contentPadding.right),
          suffixIcon: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(widget.borderWidth),
                    bottomRight: Radius.circular(widget.borderWidth))),
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
                top: widget.borderWidth,
                right: widget.borderWidth,
                bottom: widget.borderWidth,
                left: widget.contentPadding.right),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: widget.enabled == true && _canGoUp
                          ? () => _update(true)
                          : null,
                      child: Opacity(
                        opacity: widget.enabled == true && _canGoUp ? 1 : .5,
                        child: const Icon(Icons.arrow_drop_up),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: widget.enabled == true && _canGoDown
                          ? () => _update(false)
                          : null,
                      child: Opacity(
                        opacity: widget.enabled == true && _canGoDown ? 1 : .5,
                        child: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onChanged: (value) {
          final intValue = int.tryParse(value);
          widget.onChanged?.call(intValue);
          _updateArrows(intValue);
        },
        inputFormatters: [_NumberTextInputFormatter(widget.min, widget.max)],
      );

  void _update(bool up) {
    var intValue = int.tryParse(_controller.text);
    intValue == null
        ? intValue = 0
        : intValue += up ? widget.step : -widget.step;
    _controller.text = intValue.toString();
    widget.onChanged?.call(intValue);
    _updateArrows(intValue);
    _focusNode.requestFocus();
  }

  void _updateArrows(int? value) {
    final canGoUp = value == null || value < widget.max;
    final canGoDown = value == null || value > widget.min;
    if (_canGoUp != canGoUp || _canGoDown != canGoDown) {
      setState(() {
        _canGoUp = canGoUp;
        _canGoDown = canGoDown;
      });
    }
  }
}

class _NumberTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  _NumberTextInputFormatter(this.min, this.max);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (const [''].contains(newValue.text)) return newValue.copyWith(text: "1");
    final intValue = int.tryParse(newValue.text);
    if (intValue == null) return oldValue;
    if (intValue < min) return newValue.copyWith(text: min.toString());
    if (intValue > max) return newValue.copyWith(text: max.toString());
    return newValue.copyWith(text: intValue.toString());
  }
}
