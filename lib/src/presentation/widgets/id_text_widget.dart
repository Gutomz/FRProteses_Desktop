import 'package:flutter/material.dart';

class IDTextWidget extends StatelessWidget {
  final String id;

  const IDTextWidget({
    Key? key,
    required this.id,
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
        "ID: ${id.padLeft(4, "0")}",
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).disabledColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
