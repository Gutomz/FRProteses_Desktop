import 'package:flutter/material.dart';

ThemeData getLiteTheme() => ThemeData(
      primaryColor: Color.fromARGB(255, 81, 177, 255),
      shadowColor: Colors.black38,
      focusColor: Color.fromARGB(255, 81, 177, 255).withOpacity(0.4),
      hoverColor: Color.fromARGB(255, 81, 177, 255).withOpacity(0.2),
      highlightColor: Color.fromARGB(255, 81, 177, 255).withOpacity(0.3),
      canvasColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      cardColor: Colors.white,
      splashColor: Color.fromARGB(255, 81, 177, 255).withOpacity(0.3),
      iconTheme: IconThemeData(
        color: Colors.black87,
      ),
      colorScheme: ColorScheme.light(
        primary: Color.fromARGB(255, 81, 177, 255),
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
