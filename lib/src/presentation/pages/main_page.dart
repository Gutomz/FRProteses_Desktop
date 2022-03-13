import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/helpers/local_navigator.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/widgets/menu_widget.dart';
import 'package:frproteses/src/presentation/widgets/top_navigation_bar_widget.dart';

class MainPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).canvasColor,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(child: Menu()),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: ResponsiveWidget(
          largeScreenWidget: Row(
            children: [
              Expanded(child: Menu()),
              Expanded(
                flex: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: localNavigator(),
                ),
              )
            ],
          ),
          smallScreenWidget: localNavigator(),
        ),
      ),
    );
  }
}
