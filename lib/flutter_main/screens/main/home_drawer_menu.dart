import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/res/font_const.dart';
import 'package:petzola/flutter_main/screens/main/provider/NavigationModel.dart';
import 'package:petzola/generated/l10n.dart';

class HomeDrawerMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeDrawerMenuState();
  }
}

class _HomeDrawerMenuState extends State<HomeDrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * .8,
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                homeHeaderView(),
                getItemView(
                    title: S.current.myPet,
                    destinationMenu: DestinationMenu.MY_PET,
                    icon: "assets/icons/ic_my_pet.png"),
                getItemView(
                    title: S.current.wallet,
                    destinationMenu: DestinationMenu.WALLET,
                    icon: "assets/icons/ic_my_pet.png"),
                getItemView(
                    title: S.current.InviteFriend,
                    destinationMenu: DestinationMenu.INVITE_FRIEND,
                    icon: "assets/icons/ic_invite_friend.png"),
                getItemView(
                    title: S.current.favourite,
                    destinationMenu: DestinationMenu.FAVORITE,
                    icon: "assets/icons/ic_favourite.png"),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .095),
                  child: Column(
                    children: [
                      getItemView(
                          title: S.current.setting,
                          destinationMenu: DestinationMenu.SETTINGS,
                          icon: "assets/icons/ic_setting.png"),
                      getItemView(
                          title: S.current.language,
                          destinationMenu: DestinationMenu.LANGUAGE,
                          icon: "assets/icons/ic_language.png"),
                    ],
                  ),
                ),
                getItemView(
                    title: S.current.notification,
                    destinationMenu: DestinationMenu.NOTIFICATION,
                    icon: "assets/icons/ic_notification.png"),
                getItemView(
                    title: S.current.contactUs,
                    destinationMenu: DestinationMenu.CONTACT_US,
                    icon: "assets/icons/ic_contact_us.png"),
                getItemView(
                    title: S.current.termsAndCondition,
                    destinationMenu: DestinationMenu.TERMS_CONDITIONS,
                    icon: "assets/icons/ic_terms.png"),
                getItemView(
                    title: S.current.faq,
                    destinationMenu: DestinationMenu.FAQ,
                    icon: "assets/icons/ic_fag.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getItemView(
      {@required String title,
      @required DestinationMenu destinationMenu,
      @required String icon}) {
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height * .06,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .03),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              icon,
              fit: BoxFit.cover,
              width: 32,
              height: 32,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .03,
            ),
            Text(
              title,
              style:
                  Theme.of(context).textTheme.headline5.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
      onTap: () {
        // Provider.of<NavigationModel>(context, listen: false).destinationMenu =
        //     destinationMenu;
      },
    );
  }

  Widget homeHeaderView() {
    return Container(
      height: MediaQuery.of(context).size.height * .12,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .03),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset("assets/icons/ic_language.png",
              width: MediaQuery.of(context).size.width * .1,
              height: MediaQuery.of(context).size.width * .1),
          SizedBox(
            width: MediaQuery.of(context).size.width * .03,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontSize: text_head_size_head_med),
              ),
              Text(
                "Laurel Watkins",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontSize: text_head_size_normal),
              )
            ],
          )
        ],
      ),
    );
  }
}
