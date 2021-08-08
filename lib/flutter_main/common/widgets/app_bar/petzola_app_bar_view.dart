import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/screens/main/provider/NavigationModel.dart';
import 'package:petzola/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../app_bar_back_btn_view.dart';

AppBar petZolaAppBarView(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    elevation: 0.0,
    title: Text(getCurrentRouteTitle(context)),
    leading: getLeadingView(context),
    leadingWidth: Provider.of<NavigationModel>(context).destinationMenu !=
            DestinationMenu.HOME
        ? MediaQuery.of(context).size.width * .13
        : 200,
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          )),
    ],
  );
}

getLeadingView(BuildContext context) {
  if (Provider.of<NavigationModel>(context).destinationMenu !=
      DestinationMenu.HOME) {
    return AppBarBackBtnView(() {});
  } else if (Provider.of<NavigationModel>(context).destinationMenu ==
      DestinationMenu.HOME) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: Dimen.outer_boundary_field_space),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * .09,
              height: MediaQuery.of(context).size.width * .09,
              child: Icon(
                Icons.person_pin,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(),
          Text(S.current.welcome,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Color(0xff2c3e50), fontSize: 16))
        ],
      ),
    );
  }
}

String getCurrentRouteTitle(BuildContext context) {
  if (Provider.of<NavigationModel>(context).destinationMenu ==
      DestinationMenu.HOME) {
    return "";
  } else {
    return Provider.of<NavigationModel>(context).getCurrentRouteName();
  }
}
