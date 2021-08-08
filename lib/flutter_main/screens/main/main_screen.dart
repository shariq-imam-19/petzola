import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/widgets/app_bar/petzola_app_bar_view.dart';
import 'package:petzola/flutter_main/screens/main/provider/NavigationModel.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_view.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: petZolaAppBarView(context),
      key: _drawerKey,
      bottomNavigationBar: Container(
        child: BottomNavigationView(),
      ),
      body: Consumer<NavigationModel>(
        builder: (context, navigationModel, widget) {
          print("MainScreen ---> build()   " +
              navigationModel.destinationMenu.toString());
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                    .animate(animation),
                child: child,
              );
            },
            child:
                navigationModel.getCurrentView(navigationModel.destinationMenu),
          );
        },
      ),
    );
  }
}
