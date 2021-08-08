import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/screens/main/provider/NavigationModel.dart';
import 'package:provider/provider.dart';

class BottomNavigationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationView();
  }
}

class _BottomNavigationView extends State<BottomNavigationView> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: MediaQuery.of(context).size.height * .080,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/bg.png",
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getNavigationItem(
                  index: 0,
                  activeIcon: "assets/icons/ic_my_pet.png",
                  disableIcon: "assets/icons/ic_my_pet.png"),
              getNavigationItem(
                  index: 1,
                  activeIcon: "assets/icons/ic_calender.png",
                  disableIcon: "assets/icons/ic_calender.png"),
              getNavigationItem(
                  index: 2,
                  activeIcon: "assets/icons/ic_home.png",
                  disableIcon: "assets/icons/ic_home.png"),
              getNavigationItem(
                  index: 3,
                  activeIcon: "assets/icons/ic_chat.png",
                  disableIcon: "assets/icons/ic_chat.png"),
              getNavigationItem(
                  index: 4,
                  activeIcon: "assets/icons/ic_menu.png",
                  disableIcon: "assets/icons/ic_menu.png"),
            ],
          ),
        ],
      ),
    );
  }

  getNavigationItem({index, activeIcon, disableIcon}) {
    if (_selectedIndex == index) {
      return Expanded(
          flex: 1,
          child: Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Image.asset(activeIcon),
                  onTap: () {
                    _onItemTapped(index);
                  },
                ),
                Container(
                  width: 50,
                  height: 3,
                  color: Color(0xff00aeef),
                )
              ],
            ),
          ));
    } else {
      return Expanded(
          flex: 1,
          child: InkWell(
            child: Image.asset(
              disableIcon,
              fit: BoxFit.scaleDown,
            ),
            onTap: () {
              _onItemTapped(index);
            },
          ));
    }
  }

  void _onItemTapped(int index) {
    print("_onItemTapped ---> $index");
    setState(() {
      _selectedIndex = index;

      switch (index) {
        case 0:
          {
            setState(() {
              Provider.of<NavigationModel>(context, listen: false)
                  .destinationMenu = DestinationMenu.MY_PET;
            });
            break;
          }
        case 1:
          {
            setState(() {
              Provider.of<NavigationModel>(context, listen: false)
                  .destinationMenu = DestinationMenu.RESERVATION;
            });
            break;
          }
        case 2:
          {
            setState(() {
              Provider.of<NavigationModel>(context, listen: false)
                  .destinationMenu = DestinationMenu.HOME;
            });
            break;
          }
        case 3:
          {
            setState(() {
              Provider.of<NavigationModel>(context, listen: false)
                  .destinationMenu = DestinationMenu.SETTINGS;
            });
            break;
          }
        case 4:
          {
            setState(() {
              Provider.of<NavigationModel>(context, listen: false)
                  .destinationMenu = DestinationMenu.MENU;
            });
            break;
          }

      }
    });
  }
}
