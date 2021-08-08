import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/screens/add_pet/add_pet_detail_screen.dart';
import 'package:petzola/flutter_main/screens/add_pet/add_pet_intro_screen.dart';
import 'package:petzola/flutter_main/screens/add_pet/pet_profile_upload_screen.dart';
import 'package:petzola/flutter_main/screens/forgot_password/forgot_password_screen.dart';
import 'package:petzola/flutter_main/screens/home/home_screen.dart';
import 'package:petzola/flutter_main/screens/intro/select_country_screen.dart';
import 'package:petzola/flutter_main/screens/login/login_screen.dart';
import 'package:petzola/flutter_main/screens/new_password/new_password_screen.dart';
import 'package:petzola/flutter_main/screens/signup/sign_up_screen.dart';
import 'package:petzola/flutter_main/screens/verify_email/send_code_view.dart';
import 'package:petzola/flutter_main/screens/verify_email/verify_pin_pode_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;

  static const HOME = "/HOME";
  static const SELECT_COUNTRY = "/select_country_screen";
  static const LOGIN_SCREEN = "/login_screen";
  static const SIGN_UP_SCREEN = "/sing_up_screen";
  static const FORGOT_PASSWORD_SCREEN = "/forgot_password_screen";
  static const NEW_PASSWORD_SCREEN = "/new_password_screen";
  static const ADD_PET_INTRO_SCREEN = "/add_pet_intro_screen";
  static const ADD_PET_DETAILS_SCREEN = "/add_pet_details_screen";
  static const SEND_CODE_SCREEN = "/send_code_main_screen";
  static const VERIFY_PIN_CODE_SCREEN = "/verify_code_main_screen";

  static const PET_PROFILE_UPLOAD_SCREEN = "/pet_profile_upload_screen";

  static final Map<String, WidgetBuilder> _routes = {
    HOME: (context) => HomeScreen(),
    SELECT_COUNTRY: (context) => SelectCountryScreen(),
    LOGIN_SCREEN: (context) => LoginScreen(),
    SIGN_UP_SCREEN: (context) => SignUpScreen(),
    NEW_PASSWORD_SCREEN: (context) => NewPasswordScreen(),
    FORGOT_PASSWORD_SCREEN: (context) => ForgotPasswordScreen(),
    ADD_PET_INTRO_SCREEN: (context) => AddPetIntroScreen(),
    ADD_PET_DETAILS_SCREEN: (context) => AddPetDetailScreen(),
    SEND_CODE_SCREEN: (context) => SendCodeView(),
    VERIFY_PIN_CODE_SCREEN: (context) => VerifyPinCodeScreen(),
    PET_PROFILE_UPLOAD_SCREEN: (context) => PetProfileUploadScreen(),
  };

// todo add this attribute to main Appwidget  ---> onGenerateRoute: Routes.getRouteGenerate, of Main app widget
  // static Route getRouteGenerate(RouteSettings settings) =>
  //     _routeGenerate(settings);
  // // handle unNamed route here , or make some initialization for a specific route
  // static Route _routeGenerate(RouteSettings settings) {
  //
  //   switch (settings.name) {
  //     case RouteList.homeSearch:
  //       return _buildRouteFade(settings, HomeSearchPage());
  //
  //       break;
  //     default:
  //       return _errorRoute();
  //   }
  // }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Page not found'),
        ),
      );
    });
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }

  static PageRouteBuilder _buildRouteFade(
      RouteSettings settings, Widget builder) {
    return _FadedTransitionRoute(
      settings: settings,
      widget: builder,
    );
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  final RouteSettings settings;

  _FadedTransitionRoute({this.widget, this.settings})
      : super(
            settings: settings,
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(milliseconds: 100),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ),
                child: child,
              );
            });
}
