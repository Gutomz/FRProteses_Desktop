import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromARGB(255, 34, 116, 184);

ThemeData getLiteTheme() => ThemeData(
      primaryColor: kPrimaryColor,
      shadowColor: Colors.black38,
      focusColor: kPrimaryColor.withOpacity(0.6),
      hoverColor: kPrimaryColor.withOpacity(0.4),
      highlightColor: kPrimaryColor.withOpacity(0.5),
      canvasColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      cardColor: Colors.white,
      splashColor: kPrimaryColor.withOpacity(0.3),
      iconTheme: IconThemeData(
        color: Colors.black87,
      ),
      colorScheme: ColorScheme.light(
        primary: kPrimaryColor,
        tertiary: Colors.green,
        onErrorContainer: Color.fromARGB(255, 255, 135, 126),
      ),
    );

MaterialStateProperty<Color?> tableRowColor(BuildContext context) =>
    MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Theme.of(context).colorScheme.primary.withOpacity(0.08);
      }

      if (states.contains(MaterialState.hovered)) {
        return Theme.of(context).splashColor.withOpacity(0.1);
      }

      if (states.contains(MaterialState.pressed)) {
        return Theme.of(context).splashColor.withOpacity(0.3);
      }

      return null;
    });
