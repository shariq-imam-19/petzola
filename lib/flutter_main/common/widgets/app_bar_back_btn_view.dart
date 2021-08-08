import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petzola/flutter_main/screens/main/provider/NavigationModel.dart';
import 'package:provider/provider.dart';

class AppBarBackBtnView extends StatelessWidget {
  final Function onBackPressed;

  AppBarBackBtnView(this.onBackPressed);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationModel>(
        builder: (context, navigationModel, widget) {
      return getView(navigationModel);
    });
  }

  getView(NavigationModel navigationModel) {
    if (navigationModel.destinationMenu != DestinationMenu.MENU) {
      return InkWell(
        child: Container(
            margin: EdgeInsets.all(12),
            child: Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: [Color(0xffeaf0f9), Color(0xfff4f9fe)],
                    stops: [0, 1],
                    begin: Alignment(-0.00, -1.00),
                    end: Alignment(0.00, 1.00),
                    // angle: 180,
                    // scale: undefined,
                  )),
              child: Image.asset(
                "assets/images/back.png",
                width: 36,
                height: 36,
              ),
            )),
        onTap: () {
          onBackPressed();
        },
      );
    } else {
      return Container();
    }
  }
}
