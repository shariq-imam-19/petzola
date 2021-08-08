import 'package:flutter/cupertino.dart';
import 'package:petzola/flutter_main/screens/contact_us/contact_us_screen.dart';
import 'package:petzola/flutter_main/screens/faq/faq_screen.dart';
import 'package:petzola/flutter_main/screens/favorite/favorite_screen.dart';
import 'package:petzola/flutter_main/screens/home/home_screen.dart';
import 'package:petzola/flutter_main/screens/invitefriend/invite_friend_screen.dart';
import 'package:petzola/flutter_main/screens/mypet/my_pet_screen.dart';
import 'package:petzola/flutter_main/screens/notification/notification_screen.dart';
import 'package:petzola/flutter_main/screens/reservation/reservation_screen.dart';
import 'package:petzola/flutter_main/screens/settings_screen/language_screen.dart';
import 'package:petzola/flutter_main/screens/settings_screen/settings_screen.dart';
import 'package:petzola/flutter_main/screens/terms_condition/terms_and_conditionsScreen.dart';
import 'package:petzola/flutter_main/screens/wallet/wallet_screen.dart';
import 'package:petzola/generated/l10n.dart';

import '../home_drawer_menu.dart';

class NavigationModel extends ChangeNotifier {
  DestinationMenu _destinationMenu = DestinationMenu.HOME;

  set destinationMenu(DestinationMenu destinationMenu) {
    _destinationMenu = destinationMenu;
    notifyListeners();
  }

  DestinationMenu get destinationMenu {
    return _destinationMenu;
  }

  Widget getCurrentView(DestinationMenu destinationMenu) {
    switch (destinationMenu) {
      case DestinationMenu.MY_PET:
        return MyPetScreen();

      case DestinationMenu.HOME:
        return HomeScreen();
      case DestinationMenu.RESERVATION:
        return ReservationScreen();

      case DestinationMenu.MENU:
        return HomeDrawerMenu();

      case DestinationMenu.WALLET:
        return WalletScreen();

      case DestinationMenu.INVITE_FRIEND:
        return InviteFriendScreen();

      case DestinationMenu.FAVORITE:
        return FavoriteScreen();

      case DestinationMenu.SETTINGS:
        return SettingsScreen();

      case DestinationMenu.LANGUAGE:
        return LanguageScreen();

      case DestinationMenu.NOTIFICATION:
        return NotificationScreen();

      case DestinationMenu.CONTACT_US:
        return ContactUsScreen();

      case DestinationMenu.TERMS_CONDITIONS:
        return TermsAndConditionsScreen();
      case DestinationMenu.FAQ:
        return FaqScreen();
      default:
        return HomeScreen();
    }
  }

  String getCurrentRouteName() {
    switch (_destinationMenu) {
      case DestinationMenu.MY_PET:
        return S.current.myPet;

      case DestinationMenu.RESERVATION:
        return S.current.reservation;
      case DestinationMenu.HOME:
        return S.current.home;

      case DestinationMenu.WALLET:
        return S.current.wallet;

      case DestinationMenu.INVITE_FRIEND:
        return S.current.InviteFriend;

      case DestinationMenu.FAVORITE:
        return S.current.favourite;

      case DestinationMenu.SETTINGS:
        return S.current.setting;

      case DestinationMenu.LANGUAGE:
        return S.current.language;

      case DestinationMenu.NOTIFICATION:
        return S.current.notification;

      case DestinationMenu.CONTACT_US:
        return S.current.contactUs;

      case DestinationMenu.TERMS_CONDITIONS:
        return S.current.termsAndCondition;
      case DestinationMenu.FAQ:
        return S.current.faq;
      case DestinationMenu.MENU:
        return "";
    }
  }
}

enum DestinationMenu {
  MY_PET,
  HOME,
  RESERVATION,
  MENU,
  WALLET,
  INVITE_FRIEND,
  FAVORITE,
  SETTINGS,
  LANGUAGE,
  NOTIFICATION,
  CONTACT_US,
  TERMS_CONDITIONS,
  FAQ
}
