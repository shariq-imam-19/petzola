import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
class MainNotificationScreen extends StatefulWidget {


  @override
  _MainNotificationScreenState createState() => _MainNotificationScreenState();
}

class _MainNotificationScreenState extends State<MainNotificationScreen> {
  List<Map<String, dynamic>> notificationList=[
    {
    "image": "lib/assets/icons/notificationicon1.png",
    "title":"Reminder",
    "subtitle":"The Appointment Of The Medication",
    "time":"3h"
  },
    {
      "image": "lib/assets/icons/notificationicon2.png",
      "title":"Reminder",
      "subtitle":"Perform Laboratory Analysis",
      "time":"7h"
    },
    {
      "image": "lib/assets/icons/splashlogo.png",
      "title":"Petzola",
      "subtitle":"We Are Here To Help You",
      "time":"1d"
    },
    {
      "image": "lib/assets/icons/notificationicon1.png",
      "title":"Reminder",
      "subtitle":"The Appointment Of The Medication",
      "time":"3h"
    },
    {
      "image": "lib/assets/icons/notificationicon2.png",
      "title":"Reminder",
      "subtitle":"Perform Laboratory Analysis",
      "time":"7h"
    },
    {
      "image": "lib/assets/icons/splashlogo.png",
      "title":"Petzola",
      "subtitle":"We Are Here To Help You",
      "time":"1d"
    }
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Notification ",),
          ),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
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
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Notification ",),
          ),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
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
        );

    }

  }

}
