import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/app/app_model.dart';
import 'package:petzola/flutter_main/app/route.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      if (Provider.of<AppModel>(context,listen: false).isAppFirstSeen()){
        Navigator.of(context).pushReplacementNamed(Routes.SELECT_COUNTRY);
      }else{
        if (Provider.of<AppModel>(context,listen: false).isUserLoggedIn()){
          Navigator.of(context).pushReplacementNamed(Routes.HOME);
        }else{
          Navigator.of(context).pushReplacementNamed(Routes.LOGIN_SCREEN);
        }
      }
    });
    return mainView();
  }

  Widget mainView() {
    return Container(
      color: Colors.white,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
              width: 160,
              height: 150,
              image: AssetImage('assets/images/logo.png')),
          Image(image: AssetImage('assets/images/load.png'))
        ],
      ),
    );
  }
}
