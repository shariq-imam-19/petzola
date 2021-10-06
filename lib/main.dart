import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petzola/localization/demo_localization.dart';
import 'package:petzola/screens/home/home_page.dart';
import 'package:petzola/screens/home/home_screen.dart';
import 'package:petzola/screens/login_registration/login_screen.dart';
import 'package:petzola/screens/messege/messege_screen.dart';
import 'package:petzola/screens/onboarding_screens/select_language_screen.dart';
import 'package:petzola/screens/splash_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF00AEEf),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     initialRoute: '/home',
     // initialRoute: '/splash',



      routes: {
        '/home': (context) => HomePage(),
        '/splash': (context) => SplashScreen(),
      },
    );
  }
}

