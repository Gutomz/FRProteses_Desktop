import 'package:flutter/material.dart';

class FormInfoTextWidget extends StatelessWidget {
  final String title;
  final String value;

  const FormInfoTextWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Theme.of(context).disabledColor,
          width: 2,
        ),
      ),
      child: Text(
        "$title: $value",
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).disabledColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
