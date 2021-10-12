import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:petzola/localization/demo_localization.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/screens/home/home_page.dart';
import 'package:petzola/screens/home/home_screen.dart';
import 'package:petzola/screens/login_registration/login_screen.dart';
import 'package:petzola/screens/messege/messege_screen.dart';
import 'package:petzola/screens/onboarding_screens/select_language_screen.dart';
import 'package:petzola/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'common/global_variables.dart';
import 'localization/localization_model.dart';



void main() {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider<LocaleModel>(create: (context)=>LocaleModel()),
      ],
      child: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocalee(newLocale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  Locale _locale;

  setLocalee(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    Locale a = await getLocale();
    setState(() {
      _locale = a;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      locale: _locale,
      supportedLocales: [Locale("ar", "SA"), Locale("en", "US")],
      localizationsDelegates: [
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            currLang = supportedLocale.languageCode;
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      theme: ThemeData(

        primaryColor: Color(0xFF00AEEf),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     //initialRoute: '/home',
     home: Builder(
     builder: (BuildContext context) {
    return SplashScreen();
    },
    ),
       // initialRoute: '/splash',



      routes: {
        '/home': (context) => HomePage(),
        '/splash': (context) => SplashScreen(),
      },
    );
  }
}

