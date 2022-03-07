import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/presentation/config/router.dart';
import 'package:frproteses/src/presentation/config/routes.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

Navigator localNavigator() => Navigator(
      key: sl<NavigationStore>().navigationKey,
      initialRoute: getFirstRoute(),
      onGenerateRoute: generateRoute,
    );
