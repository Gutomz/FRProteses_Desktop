import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart' as ic;
import 'package:frproteses/src/presentation/config/style.dart';
import 'package:frproteses/src/presentation/pages/main_page.dart';

Future<void> main() async {
  await ic.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FRPróteses',
      theme: getLiteTheme(),
      home: MainPage(),
    );
  }
}
