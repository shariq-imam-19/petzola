import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petzola/common/style.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/screens/home/home_page.dart';

import 'onboarding_screens/select_language_screen.dart';
class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => /*HomePage()*/SelectLanguageScreen()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return splashScreen();

  }
  Widget splashScreen() {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(

            child: Column(


              children: [
                SizedBox(height: width*0.25,),
                Center(
                  child: Container(
                    height: width*0.15,
                    width: height*0.50,
                    decoration: BoxDecoration(
                      //  color: Colors.red,
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/icons/splashlogo.png'
                            ),
                            fit: BoxFit.fill
                        )
                    ),


                  ),
                ),
                SizedBox(height: height*0.30,),
                NutsActivityIndicator(
                  radius: height*0.015,
                  activeColor: Color(0xff2B3E4F),
                  inactiveColor: Color(0xff2B3E4F),
                  tickCount: 8,
                  startRatio: 0.60,
                  relativeWidth: width*0.002,
                  animationDuration: Duration(milliseconds: 123),
                ),
                SizedBox(height: height*0.15,),
              ],
            ),
          ),
        );
      case Orientation.portrait:
        return Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(


              children: [
                SizedBox(height: height*0.25,),
                Center(
                  child: Container(
                    height: height*0.15,
                    width: width*0.50,
                    decoration: BoxDecoration(
                    //  color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage(
                            'lib/assets/icons/splashlogo.png'
                        ),
                        fit: BoxFit.fill
                      )
                    ),


                  ),
                ),
                SizedBox(height: height*0.30,),
                NutsActivityIndicator(


                  radius: height*0.020,
                  activeColor: Color(0xff2B3E4F),
                  inactiveColor: Color(0x802B3E4F),
                  tickCount: 8,
                  startRatio: 0.60,
                    relativeWidth: width*0.002,
                  animationDuration: Duration(microseconds:500),
                ),
              ],
            ),
          ),
        );
    }
  }
}
