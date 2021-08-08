import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:petzola/flutter_main/app/app_model.dart';
import 'package:petzola/flutter_main/common/res/font_const.dart';

import 'AppColors.dart';
import 'res/fonts.dart';

const kProductTitleStyleLarge =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

/// Build the App Theme
ThemeData getTheme(currentLocal, AppModel appModel) {
  Logger(printer: SimplePrinter(colors: true)).v("[AppState] build Theme");

  bool isDarkTheme = appModel.darkTheme ?? false;

  if (isDarkTheme) {
    return buildDarkTheme(currentLocal).copyWith(
      primaryColor: Color(int.parse("4282476961")),
    );
  }

  //
  return ThemeData.light().copyWith(

    /// reflect on App bar Title
      appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffffffff),
          textTheme: TextTheme(
              headline6: TextStyle(
                fontFamily: 'SFProText',
                color: Color(0xff2b3e4f),
                fontSize: text_head_size_normal,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              )),
          centerTitle: true),
      scaffoldBackgroundColor: Colors.white,

      ///Head line 1
      textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'SFProDisplay',
            color: Color(0xff2b3e4f),
            fontSize: text_head_size_head_1,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),

          ///Head line 2
          headline2: TextStyle(
            fontFamily: 'SFProDisplay',
            color: Color(0xff2b3e4f),
            fontSize: text_head_size_medium,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),

          ///Head line 3
          headline3: TextStyle(
            fontFamily: 'SFProText',
            color: Color(0x9a3c3c43),
            fontSize: text_head_size_normal,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),

          ///Head line 4
          headline4: TextStyle(
            fontFamily: 'SFProText',
            color: Color(0xff2b3e4f),
            fontSize: text_head_size_head_med,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),

          ///Head line 5
          headline5: TextStyle(
            fontFamily: 'SFProText',
            color: Color(0xff2b3e4f),
            fontSize: text_head_size_normal,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),

          /// Global change <inputText>
          subtitle1: TextStyle(
            fontFamily: 'SFProText',
            color: Color(0x9a3c3c43),
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
          subtitle2: TextStyle(
            fontFamily: 'SFProText',
            color: Color(0xff2b3e4f),
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          )),

      /// reflect on Any inputForm Field
      inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
          EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintStyle: TextStyle(
            fontFamily: 'SFProText',
            color: Color(0x9a3c3c43),
            fontSize: text_head_size_normal,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          )));
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: kGrey900);
}

ThemeData buildLightTheme(currentLocal) {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: kColorScheme,
    buttonColor: kTeal400,
    cardColor: Colors.white,
    textSelectionColor: kTeal100,
    errorColor: kErrorRed,
    buttonTheme: const ButtonThemeData(
        colorScheme: kColorScheme,
        textTheme: ButtonTextTheme.normal,
        buttonColor: Color(6404710)),
    primaryColorLight: kLightBG,
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildTextTheme(base.textTheme, currentLocal),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, currentLocal),
    accentTextTheme: _buildTextTheme(base.accentTextTheme, currentLocal),
    inputDecorationTheme: const InputDecorationTheme(
        // labelStyle: TextStyle(color: Colors.red),
        // hintStyle: TextStyle(color: Colors.red),
        // errorStyle: TextStyle(color: Colors.red)
        ),
    iconTheme: _customIconTheme(base.iconTheme),
    hintColor: french_blue,
    backgroundColor: Colors.white,
    primaryColor: kLightPrimary,
    accentColor: kLightAccent,
    cursorColor: kLightAccent,
    scaffoldBackgroundColor: kLightBG,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: kDarkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      iconTheme: IconThemeData(
        color: kLightAccent,
      ),
    ),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    }),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ),
  );
}

TextTheme _buildTextTheme(TextTheme base, local) {
  return kTextTheme(base, local)
      .copyWith(
        headline5: base.headline5
            .copyWith(fontWeight: FontWeight.w500, color: Colors.red),
        headline6: base.headline6.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        subtitle1: base.subtitle1.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        displayColor: kGrey900,
        bodyColor: kGrey900,
      )
      .copyWith(headline4: kHeadlineTheme(base).headline4.copyWith());
}

ThemeData buildDarkTheme(currentLocal) {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme, currentLocal).apply(
      displayColor: kLightBG,
      bodyColor: kLightBG,
    ),
    primaryTextTheme:
        _buildTextTheme(base.primaryTextTheme, currentLocal).apply(
      displayColor: kLightBG,
      bodyColor: kLightBG,
    ),
    accentTextTheme: _buildTextTheme(base.accentTextTheme, currentLocal).apply(
      displayColor: kLightBG,
      bodyColor: kLightBG,
    ),
    cardColor: kDarkBgLight,
    brightness: Brightness.dark,
    backgroundColor: kDarkBG,
    primaryColor: kDarkBG,
    primaryColorLight: kDarkBgLight,
    accentColor: kDarkAccent,
    scaffoldBackgroundColor: kDarkBG,
    cursorColor: kDarkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: kDarkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      iconTheme: IconThemeData(
        color: kDarkAccent,
      ),
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: kColorScheme.copyWith(onPrimary: kLightBG)),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    }),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ),
  );
}

const ColorScheme kColorScheme = ColorScheme(
  primary: kTeal100,
  primaryVariant: kGrey900,
  secondary: kTeal50,
  secondaryVariant: kGrey900,
  surface: kSurfaceWhite,
  background: kBackgroundWhite,
  error: kErrorRed,
  onPrimary: kDarkBG,
  onSecondary: kGrey900,
  onSurface: kGrey900,
  onBackground: kGrey900,
  onError: kSurfaceWhite,
  brightness: Brightness.light,
);
