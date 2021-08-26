import 'dart:io';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/commons.dart';

import 'package:petzola/common/style.dart';
import 'package:petzola/screens/home/blogs_screen.dart';
import 'package:petzola/screens/home/home_screen.dart';
import 'package:petzola/screens/home/menu_screen.dart';
import 'package:petzola/screens/home/pets_screen.dart';
import 'package:petzola/screens/home/schedule_screen.dart';
import 'package:petzola/screens/notification/notification_screen.dart';

import '../../common/style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController tabBarController;
  TabController tabViewController;
  var tabData = ['Pets', 'Schedule', 'Home', 'Blog', 'Menu'] as List;
  final List<Widget> _children = [];
  int _currentIndex = 2;

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to exit an App'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    exit(0);
                  },
                )
              ],
            );
          },
        ) ??
        false;
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      tabViewController.animateTo(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabBarController = TabController(length: tabData.length, vsync: this);
    tabViewController = TabController(length: tabData.length, vsync: this);
    tabBarController.index = 2;
    tabViewController.index = tabBarController.index;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: _onBackPressed,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: renderAppbar(),
                body: TabBarView(
                  controller: tabViewController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    PetsScreen(),
                    ScheduleScreen(),
                    HomeScreen(),
                    BlogsScreen(),
                    MenuScreen(onTap: (){
                      tabBarController.index=0;
                      tabViewController.animateTo(0);
                      setState(() {});
                    },)
                  ],
                ),
                bottomNavigationBar: renderBottomNavBar(),
                /*bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: onTabTapped,
                  items: [
                    new BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text(''),
                    ),
                    new BottomNavigationBarItem(
                      icon: Icon(Icons.mail),
                      title: Text(''),
                    ),
                    new BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        title: Text('')
                    ),

                  ],
                ),*/
              ),
            );
          },
        ),
      ),
    );
  }

  Widget renderAppbar(){
    return tabBarController.index == 0 ? AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      centerTitle: true,
      leadingWidth: 65,
      title: VariableText(text: 'My Pets', fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb',),
      leading: Container(
        margin: EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFEAF0F9),
              borderRadius: BorderRadius.circular(60)
            ),
            child: IconButton(icon: Image.asset('lib/assets/icons/appbar_back.png', scale: 3.2,),
              onPressed: (){
                tabBarController.index = 2;
                _currentIndex = 2;
                tabViewController.animateTo(2);
                setState(() {});
              },
            ),
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>MainNotificationScreen()));},
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/notification2x.png", color: appBarIconColor),
          ),
        ),
        SizedBox(width: 12),
        InkWell(
          onTap: () {},
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/chat2x.png", color: appBarIconColor),
          ),
        ),
        SizedBox(width: 16,),
      ],
    ):
    AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 16,
      title:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF8F7F7),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Image.asset('lib/assets/images/user_profile.png', scale: 3.1,),
              ),
              SizedBox(width: 10),
              tabViewController.index == 2 ?
              VariableText(text: 'Welcome', fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb',)
                  :
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children:[
              VariableText(text: 'Welcome Back', fontcolor: Color(0xFF3C3C43), fontsize: 11, fontFamily: 'sftsb'),
                VariableText(text: 'Laurel Watkins', fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb'),
              ]
              )
            ],
          ),
          /*Row(
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  child: ImageIcon(
                    AssetImage('lib/assets/icons/notification2x.png'),
                    color: Colors.black,
                    size: 26,
                  ),
                ),
              ),
              SizedBox(width: 12),
              GestureDetector(
                onTap: (){
                  print("asd");
                },
                child: Container(
                  child: ImageIcon(
                    AssetImage('lib/assets/icons/chat2x.png'),
                    color: Colors.black,
                    size: 26,
                  ),
                ),
              )
            ],
          )*/
        ],
      ),
      actions: [
        InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>MainNotificationScreen()));},
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/notification2x.png", color: appBarIconColor),
          ),
        ),
        SizedBox(width: 12),
        InkWell(
          onTap: () {},
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/chat2x.png", color: appBarIconColor),
          ),
        ),
        SizedBox(width: 16,),
      ],
    );
  }

  Widget renderBottomNavBar() {
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return ClipPath(
          clipper: ArcClipper(),
          child: Container(
            color: Colors.white,
            height: 70,
            width: MediaQuery.of(context).size.width /

                (2 /
                    (MediaQuery.of(context).size.height /
                        MediaQuery.of(context).size.width)),
            child: TabBar(
              controller: tabBarController,
              onTap: onTabTapped,
              isScrollable: false,
              indicatorWeight: 1,
              //labelColor: Theme.of(context).primaryColor,
              //unselectedLabelColor: Colors.red,
              //unselectedLabelColor: Theme.of(context).primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.all(2.0),
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(
                    icon: ImageIcon(
                      AssetImage('lib/assets/icons/mypets.png'),
                      color: tabBarController.index == 0
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 30,
                    )),
                Tab(
                    icon: ImageIcon(
                      AssetImage('lib/assets/icons/appointment.png'),
                      color: tabBarController.index == 1
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 30,
                    )),
                Tab(
                    icon: ImageIcon(
                      AssetImage('lib/assets/icons/home.png'),
                      color: tabBarController.index == 2
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 30,
                    )),
                Tab(
                    icon: ImageIcon(
                      AssetImage('lib/assets/icons/network.png'),
                      color: tabBarController.index == 3
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 30,
                    )),
                Tab(
                    icon: ImageIcon(
                      AssetImage('lib/assets/icons/menu.png'),
                      color: tabBarController.index == 4
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 30,
                    ))
              ],
            ),
          ),
        );
      case Orientation.portrait:
        return ClipPath(
          clipper: ArcClipper(),
          child: Container(
            //color: Colors.red,
            height: 90,
            width: MediaQuery.of(context).size.width /

                (2 /
                    (MediaQuery.of(context).size.height /
                        MediaQuery.of(context).size.width)),
            child: TabBar(
              controller: tabBarController,
              onTap: onTabTapped,
              isScrollable: false,
              indicatorWeight: 2,
              //labelColor: Theme.of(context).primaryColor,
              //unselectedLabelColor: Colors.red,
              //unselectedLabelColor: Theme.of(context).primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.all(2.0),
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(
                    icon: ImageIcon(
                      AssetImage('lib/assets/icons/mypets.png'),
                      color: tabBarController.index == 0
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 30,
                    )),
                Tab(
                    icon: ImageIcon(
                      AssetImage('lib/assets/icons/appointment.png'),
                      color: tabBarController.index == 1
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 30,
                    )),
                Tab(
                    icon: ImageIcon(
                      AssetImage('lib/assets/icons/home.png'),
                      color: tabBarController.index == 2
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 30,
                    )),
                Tab(
                    icon: ImageIcon(
                      AssetImage('lib/assets/icons/network.png'),
                      color: tabBarController.index == 3
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 30,
                    )),
                Tab(
                    icon: ImageIcon(
                      AssetImage('lib/assets/icons/menu.png'),
                      color: tabBarController.index == 4
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 30,
                    ))
              ],
            ),
          ),
        );
    }
  }

  List<Widget> renderTabbar() {
    List<Widget> list = [];
    tabData.forEach((item) {
      list.add(Tab(
        icon: ImageIcon(
          AssetImage('lib/assets/icons/menu.png'),
          color: tabBarController.index == _currentIndex
              ? Theme.of(context).primaryColor
              : Colors.grey,
          size: 35,
        ),
      ));
    });

    return list;
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    var controlPoint = Offset(size.width/2, -20);
    var endPoint = Offset(0, 20);
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 20);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}
