import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isNegative;
  final bool isPositive;

  const OverviewCard({
    Key? key,
    required this.title,
    required this.value,
    this.isNegative = false,
    this.isPositive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 5),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: _getValueColor(context),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Color? _getValueColor(BuildContext context) {
    if (isNegative) {
      return Theme.of(context).errorColor;
    }

    if (isPositive) {
      return Theme.of(context).colorScheme.tertiary;
    }

    return null;
  }
}
