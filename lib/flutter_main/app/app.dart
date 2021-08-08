import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:petzola/flutter_main/app/route.dart';
import 'package:petzola/flutter_main/common/stats_widgets.dart';
import 'package:petzola/flutter_main/common/styles.dart';
import 'package:petzola/flutter_main/common/tools.dart';
import 'package:petzola/flutter_main/screens/add_pet/add_pet_intro_screen.dart';
import 'package:petzola/flutter_main/screens/home/home_screen.dart';
import 'package:petzola/flutter_main/screens/login/login_screen.dart';
import 'package:petzola/flutter_main/screens/main/main_screen.dart';
import 'package:petzola/flutter_main/screens/main/provider/NavigationModel.dart';
import 'package:petzola/flutter_main/screens/verify_email/send_code_view.dart';
import 'package:petzola/flutter_main/screens/verify_email/verify_pin_pode_screen.dart';
import 'package:petzola/flutter_main/storage/pref_manager.dart';
import 'package:petzola/generated/l10n.dart';
import 'package:provider/provider.dart';

import 'app_model.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  final _app = AppModel();
  final _navigationModel = NavigationModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext appContext) {
    // print("Current App Local ---> "+Provider.of<AppModel>(context,listen: false).local.languageCode.toString() );
    return FutureBuilder(
        future: PrefManager().setupSharedPreferences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            hideLoading();
            return ChangeNotifierProvider<AppModel>.value(
              value: _app,
              child: Consumer<AppModel>(
                builder: (context, value, child) {
                  return MultiProvider(
                    providers: [
                      ChangeNotifierProvider.value(value: _app),
                      ChangeNotifierProvider.value(value: _navigationModel),
                    ],
                    child: MaterialApp(
                      navigatorKey: navigatorKey,

                      ///todo include MaterialApp to new <consumer> decedent of AppLanguageModel
                      debugShowCheckedModeBanner: false,
                      supportedLocales: S.delegate.supportedLocales,
                      locale: Provider.of<AppModel>(context).local,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        DefaultCupertinoLocalizations.delegate,
                      ],
                      builder: EasyLoading.init(),
                      theme: getTheme(_app.local.languageCode, value),
                      home: getNextScreen(),
                      routes: Routes.getAll(),
                    ),
                  );
                },
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              color: Color(0xffffffff),
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  getNextScreen() {
    return LoginScreen();
    // if (PrefManager().getUserToken() != null) {
    //   return HomeScreen();
    // } else {
    //   return SignUpScreen();
    // }
  }


}
