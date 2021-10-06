import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/screens/notification/notification_screen.dart';

import 'messege_details_Screen.dart';
class MainMessegeScreen extends StatefulWidget {


  @override
  _MainMessegeScreenState createState() => _MainMessegeScreenState();
}

class _MainMessegeScreenState extends State<MainMessegeScreen> {
  List<Map<String, dynamic>> messegeList=[
    {
      "image": "lib/assets/images/appointment_doctor.png",
      "title":"Reminder",
      "subtitle":"Mauris Neque Nisi, Faucibus Non…",
      "time":"4h",
      "isRead":false
    },
    {
      "image": "lib/assets/images/appointment_doctor2.png",
      "title":"Timothy Young",
      "subtitle":" Elementum In, Convallis Et Eros…",
      "time":"7h",
      "isRead":false
    },
    {
      "image": "lib/assets/images/appointment_doctor3.png",
      "title":"Carolyn Henderson",
      "subtitle":" Sed Pretium Sem Libero,",
      "time":"21d",
      "isRead":true
    },
    {
      "image": "lib/assets/images/appointment_doctor.png",
      "title":"Reminder",
      "subtitle":"Mauris Neque Nisi, Faucibus Non…",
      "time":"4h",
      "isRead":false
    },
    {
      "image": "lib/assets/images/appointment_doctor2.png",
      "title":"Timothy Young",
      "subtitle":" Elementum In, Convallis Et Eros…",
      "time":"7h",
      "isRead":false
    },
    {
      "image": "lib/assets/images/appointment_doctor3.png",
      "title":"Carolyn Henderson",
      "subtitle":" Sed Pretium Sem Libero,",
      "time":"21d",
      "isRead":true
    },
  ];
  @override
  Widget build(BuildContext context) {
    return NotificationScreen();
  }
  Widget NotificationScreen(){
    switch(MediaQuery.of(context).orientation){
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: renderAppbar(),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
              physics: ScrollPhysics(),
              child:Padding(
                padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                child: Column(
                  children: [

                    SizedBox(height: height*0.03,),
                    Row(
                      children: [
                        Expanded(
                          child: RectangluartextFeildWithStartIcon(
                            heights:height*0.07,
                            fontsize: height*0.019,
                            hinttext: getTranslated(context, "Search"),
                            imageIconPath: "lib/assets/icons/searchIcon.png",
                            keytype: TextInputType.text,

                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.03,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>MainMessegeDetailsScreen()));
                      },
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: messegeList.length,
                          itemBuilder: (BuildContext context,int index){
                            return     Column(
                              children: [

                                Row(
                                  children: [
                                    Expanded(
                                      child:Container(
                                        height: height*0.13,
                                        decoration: BoxDecoration(
                                          color: messegeList[index]['isRead']?Color(0xfff0F5FC):themeColor2,
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
                                                      image:  AssetImage(messegeList[index]['image']),
                                                    )
                                                ),

                                              ),

                                              SizedBox(width: height*0.02,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  VariableText(text: messegeList[index]['title'],
                                                    fontFamily: 'sfpr',
                                                    fontsize: height*0.017,
                                                    fontcolor: Color(0xff2B3E4F),),
                                                  SizedBox(height: height*0.0055,),
                                                  VariableText(text: messegeList[index]['subtitle'],
                                                    fontFamily: 'sfrr',
                                                    fontsize: height*0.013,
                                                    fontcolor: Color(0x6c3C3C43),),
                                                ],
                                              ),
                                              Spacer(),
                                              Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: VariableText(text: messegeList[index]['time'],
                                                      fontFamily: 'sfrr',
                                                      fontsize: height*0.013,
                                                      fontcolor: Color(0x6c3C3C43),),
                                                  ),
                                                  SizedBox(height: height*0.023,),
                                                  messegeList[index]['isRead']? Container(
                                                    height: 20,
                                                    width: 20,

                                                    decoration: BoxDecoration(
                                                      color: Color(0xffF4207A),
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),

                                                    child: Center(
                                                      child: VariableText(text: "1",
                                                        fontFamily: 'sfrr',
                                                        fontsize: height*0.013,
                                                        fontcolor: themeColor2,),
                                                    ),
                                                  ):Container(),
                                                ],
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
                            );
                          }),
                    ),
                  ],
                ),
              )

          ),
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: renderAppbar(),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
              physics: ScrollPhysics(),
              child:Padding(
                padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                child: Column(
                  children: [

                    SizedBox(height: height*0.03,),
                    Row(
                      children: [
                        Expanded(
                          child: RectangluartextFeildWithStartIcon(
                            heights:height*0.06,
                            fontsize: height*0.019,
                            hinttext: getTranslated(context, "Search"),
                            imageIconPath: "lib/assets/icons/searchIcon.png",
                            keytype: TextInputType.text,

                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.03,),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: messegeList.length,
                        itemBuilder: (BuildContext context,int index){
                          return     Column(
                            children: [

                              Row(
                                children: [
                                  Expanded(
                                    child:InkWell(
                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>MainMessegeDetailsScreen()));
                          },
                                      child: Container(
                                        height: height*0.13,
                                        decoration: BoxDecoration(
                                          color: messegeList[index]['isRead']?Color(0xfff0F5FC):themeColor2,
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
                                                      image:  AssetImage(messegeList[index]['image']),
                                                    )
                                                ),

                                              ),

                                              SizedBox(width: height*0.02,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  VariableText(text: messegeList[index]['title'],
                                                    fontFamily: 'sfpr',
                                                    fontsize: height*0.017,
                                                    fontcolor: Color(0xff2B3E4F),),
                                                  SizedBox(height: height*0.0055,),
                                                  VariableText(text: messegeList[index]['subtitle'],
                                                    fontFamily: 'sfrr',
                                                    fontsize: height*0.013,
                                                    fontcolor: Color(0x6c3C3C43),),
                                                ],
                                              ),
                                              Spacer(),
                                              Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: VariableText(text: messegeList[index]['time'],
                                                      fontFamily: 'sfrr',
                                                      fontsize: height*0.013,
                                                      fontcolor: Color(0x6c3C3C43),),
                                                  ),
                                                  SizedBox(height: height*0.023,),
                                                  messegeList[index]['isRead']? Container(
                                                    height: 20,
                                                    width: 20,

                                                    decoration: BoxDecoration(
                                                      color: Color(0xffF4207A),
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),

                                                    child: Center(
                                                      child: VariableText(text: "1",
                                                        fontFamily: 'sfrr',
                                                        fontsize: height*0.013,
                                                        fontcolor: themeColor2,),
                                                    ),
                                                  ):Container(),
                                                ],
                                              ),






                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height*0.03,),
                            ],
                          );
                        }),
                  ],
                ),
              )

          ),
        );

    }

  }
  Widget renderAppbar(){
    return
    AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 16,
      automaticallyImplyLeading: false,
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

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    VariableText(text: 'Welcome Back', fontcolor: Color(0xFF3C3C43), fontsize: 11, fontFamily: 'sftsb'),
                    VariableText(text: 'Laurel Watkins', fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb'),
                  ]
              )
            ],
          ),

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
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>MainMessegeScreen()));
          },
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/chat2x.png", color: appBarIconColor),
          ),
        ),
        SizedBox(width: 16,),
      ],
    );
  }

}
