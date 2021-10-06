import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/global_variables.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'dart:math' as math;

import 'package:petzola/screens/messege/messege_screen.dart';

class MainNotificationScreen extends StatefulWidget {


  @override
  _MainNotificationScreenState createState() => _MainNotificationScreenState();
}

class _MainNotificationScreenState extends State<MainNotificationScreen> with TickerProviderStateMixin{

  List<Map<String, dynamic>> notificationList=[
    {
    "image": "lib/assets/icons/notificationicon1.png",
    "title":"Reminder",
    "subtitle":"The Appointment Of The Medication",
    "time":"3h",
      "detail": "You have an appointment with doctor Bobby Clerk at his clinic around 2pm"
  },
    {
      "image": "lib/assets/icons/notificationicon2.png",
      "title":"Reminder",
      "subtitle":"Perform Laboratory Analysis",
      "time":"7h",
      "detail": "You have an appointment with doctor Bobby Clerk at his clinic around 2pm"
    },
    {
      "image": "lib/assets/icons/splashlogo.png",
      "title":"Petzola",
      "subtitle":"We Are Here To Help You",
      "time":"1d",
      "detail": "You have an appointment with doctor Bobby Clerk at his clinic around 2pm"
    },
    {
      "image": "lib/assets/icons/notificationicon1.png",
      "title":"Reminder",
      "subtitle":"The Appointment Of The Medication",
      "time":"3h",
      "detail": "You have an appointment with doctor Bobby Clerk at his clinic around 2pm"
    },
    {
      "image": "lib/assets/icons/notificationicon2.png",
      "title":"Reminder",
      "subtitle":"Perform Laboratory Analysis",
      "time":"7h",
      "detail": "You have an appointment with doctor Bobby Clerk at his clinic around 2pm"
    },
    {
      "image": "lib/assets/icons/splashlogo.png",
      "title":"Petzola",
      "subtitle":"We Are Here To Help You",
      "time":"1d",
      "detail": "You have an appointment with doctor Bobby Clerk at his clinic around 2pm"
    }
 ];

  double _cHeight = 100;
  bool showOtions = true;
  List<double> _height=[];
  List<double> _width=[];
  List<bool> showDetails=[];
  List<bool> showActions=[];
  List<bool> showConfirm=[];
  List<Color> colorList = [];

  onShowActions(int i){
    if(showDetails[i] == true) {
      setState(() {
        _height[i] = _height[i] + 50;
        showDetails[i] = false;
      });

    }else{
      setState(() {
        _height[i] = _height[i] - 50;
        showDetails[i] = true;
      });
    }
  }

  onSwipe(int i){
    if(showActions[i] == false){
      setState(() {
        showActions[i] = true;
      });
    }else{
      setState(() {
        showActions[i] = false;
      });
    }
  }

  onDelete(int i){
    if(showConfirm[i] == false){
      setState(() {
        showActions[i] = false;
        showConfirm[i] = true;
      });
    }else{
      setState(() {
        showConfirm[i] = false;
      });
    }
  }
  hideAll(int i){
      setState(() {
        showActions[i] = false;
        showConfirm[i] = false;
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0; i<notificationList.length; i++){
      showDetails.add(true);
      showActions.add(false);
      showConfirm.add(false);
      _height.add(100.0);
      _width.add(0.0);
      colorList.add(Colors.transparent);
    }
  }


  @override
  Widget build(BuildContext context) {
    return NotificationScreen();
  }
  Widget NotificationScreen(){
    switch(MediaQuery.of(context).orientation){
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              titleSpacing: 0,
              centerTitle: true,
              leadingWidth: 65,
              title: VariableText(text: getTranslated(context, 'Notification') , fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb',),
              leading: Container(
                margin: EdgeInsets.only(left: 8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  currLang == 'ar' ?
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFEAF0F9),
                        borderRadius: BorderRadius.circular(60)
                    ),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: IconButton(icon: Image.asset('lib/assets/icons/appbar_back.png', scale: 3.2,),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ) :
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFEAF0F9),
                        borderRadius: BorderRadius.circular(60)
                    ),
                    child: IconButton(icon: Image.asset('lib/assets/icons/appbar_back.png', scale: 3.2,),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                indicatorColor: themeColor1,
                labelColor: themeColor1,
                unselectedLabelColor: Colors.black54,
                tabs: [
                  Tab(text: 'Overdue'),
                  Tab(text: 'Upcoming'),
                ],
              ),

              /*actions: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>MainNotificationScreen()));
                    },
                    child: SizedBox(
                      width: 26,
                      child: Image.asset("lib/assets/icons/notification2x.png"),
                    ),
                  ),
                  SizedBox(width: 12),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>MainMessegeScreen()));
                    },
                    child: SizedBox(
                      width: 26,
                      child: Image.asset("lib/assets/icons/chat2x.png"),
                    ),
                  ),
                  SizedBox(width: 16,),
                ],*/
            ),
            backgroundColor: themeColor2,
            body: TabBarView(
              children: [
                SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child:Column(
                      children: [
                        SizedBox(height: height*0.05,),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: notificationList.length,
                            itemBuilder: (BuildContext context,int index){
                              return     Padding(
                                padding:  EdgeInsets.symmetric(horizontal: height*0.025),

                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child:Container(
                                            height: height*0.13,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Color(0x6c2B3E4F),width: 0.3),
                                              borderRadius: BorderRadius.circular(height*0.015),
                                            ),
                                            child:
                                            Padding(
                                              padding:  EdgeInsets.all( height*0.025),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: height*0.08,
                                                    width: width*0.15,
                                                    decoration: BoxDecoration(
                                                      //  color: Colors.red,
                                                        image: DecorationImage(
                                                          image:  AssetImage(notificationList[index]['image']),
                                                        )
                                                    ),

                                                  ),

                                                  SizedBox(width: height*0.02,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      VariableText(text: notificationList[index]['title'],
                                                        fontFamily: 'sfpr',
                                                        fontsize: height*0.017,
                                                        fontcolor: Color(0xff2B3E4F),),
                                                      SizedBox(height: height*0.0055,),
                                                      VariableText(text: notificationList[index]['subtitle'],
                                                        fontFamily: 'sfrr',
                                                        fontsize: height*0.013,
                                                        fontcolor: Color(0x6c3C3C43),),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: VariableText(text: notificationList[index]['time'],
                                                      fontFamily: 'sfrr',
                                                      fontsize: height*0.013,
                                                      fontcolor: Color(0x6c3C3C43),),
                                                  ),


                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height*0.03,),
                                  ],
                                ),
                              );
                            }),
                      ],
                    )

                ),
                SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child:Column(
                      children: [
                        SizedBox(height: height*0.05,),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: notificationList.length,
                            itemBuilder: (BuildContext context,int index){
                              return     Padding(
                                padding:  EdgeInsets.symmetric(horizontal: height*0.025),

                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child:Container(
                                            height: height*0.13,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Color(0x6c2B3E4F),width: 0.3),
                                              borderRadius: BorderRadius.circular(height*0.015),
                                            ),
                                            child:
                                            Padding(
                                              padding:  EdgeInsets.all( height*0.025),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: height*0.08,
                                                    width: width*0.15,
                                                    decoration: BoxDecoration(
                                                      //  color: Colors.red,
                                                        image: DecorationImage(
                                                          image:  AssetImage(notificationList[index]['image']),
                                                        )
                                                    ),

                                                  ),

                                                  SizedBox(width: height*0.02,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      VariableText(text: notificationList[index]['title'],
                                                        fontFamily: 'sfpr',
                                                        fontsize: height*0.017,
                                                        fontcolor: Color(0xff2B3E4F),),
                                                      SizedBox(height: height*0.0055,),
                                                      VariableText(text: notificationList[index]['subtitle'],
                                                        fontFamily: 'sfrr',
                                                        fontsize: height*0.013,
                                                        fontcolor: Color(0x6c3C3C43),),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: VariableText(text: notificationList[index]['time'],
                                                      fontFamily: 'sfrr',
                                                      fontsize: height*0.013,
                                                      fontcolor: Color(0x6c3C3C43),),
                                                  ),


                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height*0.03,),
                                  ],
                                ),
                              );
                            }),
                      ],
                    )

                ),
              ],
            ),
          ),
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        //cHeight = MediaQuery.of(context).size.height * 0.13;
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              titleSpacing: 0,
              centerTitle: true,
              leadingWidth: 65,
              title: VariableText(text: getTranslated(context, 'Notification') , fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb',),
              leading: Container(
                margin: EdgeInsets.only(left: 8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  currLang == 'ar' ?
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFEAF0F9),
                        borderRadius: BorderRadius.circular(60)
                    ),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: IconButton(icon: Image.asset('lib/assets/icons/appbar_back.png', scale: 3.2,),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ) :
                  Container(
                    decoration: BoxDecoration(

                        color: Color(0xFFEAF0F9),
                        borderRadius: BorderRadius.circular(60)
                    ),
                    child: IconButton(icon: Image.asset('lib/assets/icons/appbar_back.png', scale: 3.2,),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                indicatorColor: themeColor1,
                labelColor: themeColor1,
                unselectedLabelColor: Colors.black54,
                tabs: [
                  Tab(text: getTranslated(context, 'Overdue')),
                  Tab(text: getTranslated(context, 'Upcoming')),
                ],
              ),
            ),
            backgroundColor: themeColor2,
            body: TabBarView(
              children: [
                SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child:Column(
                      children: [
                        SizedBox(height: height*0.05,),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: notificationList.length,
                            itemBuilder: (BuildContext context,int index){
                              return Padding(
                                padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(

                                            onTap: (){
                                              onShowActions(index);
                                            },
                                            onHorizontalDragEnd: (value){
                                              onSwipe(index);
                                            },
                                            child: AnimatedContainer(
                                              height: _height[index],
                                              duration: Duration(seconds: 1),
                                              curve: Curves.fastLinearToSlowEaseIn,
                                              decoration: BoxDecoration(
                                                //color: colorList[index],
                                                border: Border.all(color: Color(0x6c2B3E4F),width: 0.3),
                                                borderRadius: BorderRadius.circular(height*0.015),
                                              ),
                                              child:
                                              Stack(
                                                children: [
                                                  Padding(
                                                    padding:  EdgeInsets.all( height*0.025),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  height: height*0.06,
                                                                  width: width*0.15,
                                                                  decoration: BoxDecoration(
                                                                      //color: Colors.red,
                                                                      image: DecorationImage(
                                                                        image:  AssetImage(notificationList[index]['image']),
                                                                      )
                                                                  ),

                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(width: height*0.02,),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                SizedBox(height: height*0.01,),
                                                                VariableText(text: notificationList[index]['title'],
                                                                  fontFamily: 'sfpr',
                                                                  fontsize: height*0.017,
                                                                  fontcolor: Color(0xff2B3E4F),),
                                                                SizedBox(height: height*0.0055,),
                                                                VariableText(text: notificationList[index]['subtitle'],
                                                                  fontFamily: 'sfrr',
                                                                  fontsize: height*0.013,
                                                                  fontcolor: Color(0x6c3C3C43),),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            Align(
                                                              alignment: Alignment.topRight,
                                                              child: VariableText(text: notificationList[index]['time'],
                                                                fontFamily: 'sfrr',
                                                                fontsize: height*0.013,
                                                                fontcolor: Color(0x6c3C3C43),),
                                                            ),
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        showDetails[index] == false ?
                                                        Flexible(
                                                          child: DelayedDisplay(
                                                            slidingCurve: Curves.fastLinearToSlowEaseIn,
                                                            delay: Duration(milliseconds: 100),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Flexible(
                                                                  child: VariableText(text: notificationList[index]['detail'],
                                                                    max_lines: 3,
                                                                    fontFamily: 'sfrr',
                                                                    fontsize: height*0.014,
                                                                    fontcolor: Color(0x6c3C3C43),),
                                                                ),
                                                               /* Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                                                      child: Container(
                                                                        height: 30,
                                                                        width: 30,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(60),
                                                                          color: Colors.green
                                                                        ),
                                                                        child: Center(
                                                                          child: Icon(Icons.check,color: Colors.white,),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    VariableText(text: 'Done',
                                                                      fontFamily: 'sfpr',
                                                                      fontsize: height*0.013,
                                                                      fontcolor: Color(0xff2B3E4F),),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(vertical: 5),
                                                                        child: Container(
                                                                          height: 30,
                                                                          width: 30,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(60),
                                                                              color: Colors.orangeAccent
                                                                          ),
                                                                          child: Center(
                                                                            child: Icon(Icons.notifications_active,color: Colors.white,),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      VariableText(text: 'Snooze',
                                                                        fontFamily: 'sfpr',
                                                                        fontsize: height*0.013,
                                                                        fontcolor: Color(0xff2B3E4F),),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                                                      child: Container(
                                                                        height: 30,
                                                                        width: 30,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(60),
                                                                            color: Colors.red
                                                                        ),
                                                                        child: Center(
                                                                          child: Icon(Icons.clear,color: Colors.white,),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    VariableText(text: 'Delete',
                                                                      fontFamily: 'sfpr',
                                                                      fontsize: height*0.013,
                                                                      fontcolor: Color(0xff2B3E4F),),
                                                                  ],
                                                                )*/
                                                              ],
                                                            ),
                                                          ),
                                                        ) : Container()
                                                      ],
                                                    ),
                                                  ),

                                                  showActions[index] == true ?
                                                  DelayedDisplay(
                                                    slidingCurve: Curves.fastLinearToSlowEaseIn,
                                                    slidingBeginOffset: Offset(1.5,0.0),
                                                    delay: Duration(milliseconds: 100),
                                                    child: AnimatedContainer(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      curve: Curves.fastOutSlowIn,
                                                      duration: Duration(milliseconds: 300),
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue.withOpacity(0.9),
                                                        border: Border.all(color: Color(0x6c2B3E4F),width: 0.3),
                                                        borderRadius: BorderRadius.circular(height*0.015),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: (){
                                                                  onSwipe(index);
                                                                },
                                                                child: Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                                                      child: Container(
                                                                        height: 30,
                                                                        width: 30,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(60),
                                                                            color: Colors.green
                                                                        ),
                                                                        child: Center(
                                                                          child: Icon(Icons.check,color: Colors.white,),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    VariableText(text: 'Done',
                                                                      fontFamily: 'sfpr',
                                                                      fontsize: height*0.013,
                                                                      fontcolor: Color(0xff2B3E4F),),
                                                                  ],
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: (){
                                                                  onSwipe(index);
                                                                },
                                                                child: Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(vertical: 5),
                                                                        child: Container(
                                                                          height: 30,
                                                                          width: 30,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(60),
                                                                              color: Colors.orangeAccent
                                                                          ),
                                                                          child: Center(
                                                                            child: Icon(Icons.notifications_active,color: Colors.white,),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      VariableText(text: 'Snooze',
                                                                        fontFamily: 'sfpr',
                                                                        fontsize: height*0.013,
                                                                        fontcolor: Color(0xff2B3E4F),),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: (){
                                                                  onDelete(index);
                                                                },
                                                                child: Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                                                      child: Container(
                                                                        height: 30,
                                                                        width: 30,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(60),
                                                                            color: Colors.red
                                                                        ),
                                                                        child: Center(
                                                                          child: Icon(Icons.clear,color: Colors.white,),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    VariableText(text: 'Delete',
                                                                      fontFamily: 'sfpr',
                                                                      fontsize: height*0.013,
                                                                      fontcolor: Color(0xff2B3E4F),),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),

                                                    ),
                                                  ) :
                                                  Container(),

                                                  showConfirm[index] == true ?
                                                  DelayedDisplay(
                                                    slidingCurve: Curves.fastLinearToSlowEaseIn,
                                                    slidingBeginOffset: Offset(0.0,0.0),
                                                    delay: Duration(milliseconds: 1),
                                                    child: AnimatedContainer(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      curve: Curves.fastOutSlowIn,
                                                      duration: Duration(milliseconds: 300),
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        border: Border.all(color: Color(0x6c2B3E4F),width: 0.3),
                                                        borderRadius: BorderRadius.circular(height*0.015),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: (){
                                                                  hideAll(index);
                                                                },
                                                                child: Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                                                      child: Container(
                                                                        height: 30,
                                                                        width: 30,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(60),
                                                                            color: Colors.red
                                                                        ),
                                                                        child: Center(
                                                                          child: Icon(Icons.clear,color: Colors.white,),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    VariableText(text: 'Delete',
                                                                      fontFamily: 'sfpr',
                                                                      fontsize: height*0.013,
                                                                      fontcolor: Color(0xff2B3E4F),),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),

                                                    ),
                                                  ) :
                                                  Container()
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height*0.03,),
                                  ],
                                ),
                              );
                            }),
                      ],
                    )

                ),
                SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child:Column(
                      children: [
                        SizedBox(height: height*0.05,),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: notificationList.length,
                            itemBuilder: (BuildContext context,int index){
                              return     Padding(
                                padding:  EdgeInsets.symmetric(horizontal: height*0.025),

                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child:Container(
                                            height: height*0.13,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Color(0x6c2B3E4F),width: 0.3),
                                              borderRadius: BorderRadius.circular(height*0.015),
                                            ),
                                            child:
                                            Padding(
                                              padding:  EdgeInsets.all( height*0.025),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: height*0.08,
                                                    width: width*0.15,
                                                    decoration: BoxDecoration(
                                                      //  color: Colors.red,
                                                        image: DecorationImage(
                                                          image:  AssetImage(notificationList[index]['image']),
                                                        )
                                                    ),

                                                  ),

                                                  SizedBox(width: height*0.02,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      VariableText(text: notificationList[index]['title'],
                                                        fontFamily: 'sfpr',
                                                        fontsize: height*0.017,
                                                        fontcolor: Color(0xff2B3E4F),),
                                                      SizedBox(height: height*0.0055,),
                                                      VariableText(text: notificationList[index]['subtitle'],
                                                        fontFamily: 'sfrr',
                                                        fontsize: height*0.013,
                                                        fontcolor: Color(0x6c3C3C43),),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: VariableText(text: notificationList[index]['time'],
                                                      fontFamily: 'sfrr',
                                                      fontsize: height*0.013,
                                                      fontcolor: Color(0x6c3C3C43),),
                                                  ),


                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height*0.03,),
                                  ],
                                ),
                              );
                            }),
                      ],
                    )

                ),
              ],
            ),
          ),
        );

    }

  }

}
