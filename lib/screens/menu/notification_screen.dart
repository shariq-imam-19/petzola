import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
class NotificationScreen extends StatefulWidget {

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isSwitched=true;
  @override
  Widget build(BuildContext context) {
    return NotificationScreen();
  }
  Widget NotificationScreen() {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: width,title: "Settings Notification",),
          ),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(

            child: Padding(
              padding:  EdgeInsets.all(height*0.01),
              child: Column(
                children: [

                  SizedBox(height: width*0.03,),
                  ListTile(
                    leading:
                    VariableText(text: "Notification Sound",
                      fontsize: width*0.023,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.normal,
                      fontFamily: 'sftr',),

                    trailing:Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Color(0xff34C759),
                      activeColor:  themeColor2,
                    ),
                  ),


                  SizedBox(height: width*0.30,),

                  Padding(
                    padding:  EdgeInsets.only(bottom: width*0.03),
                    child: CustomButton(
                        buttonHeight: width*0.07,
                        buttonWidth:width*0.95,
                        buttonBorderRadius:8,
                        buttonFontSize:width*0.025,
                        buttonColor:themeColor1,
                        buttonTextColor:themeColor2,
                        buttonText: "Save change ",
                        buttonFontFamily:'sfdm',
                        buttonOnTap:(){
                          Navigator.pop(context);
                        }
                    ),
                  )





                ],
              ),
            ),
          ),
        );
      case Orientation.portrait:
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Settings Notification",),
          ),
          backgroundColor: themeColor2,
          body: Padding(
            padding:  EdgeInsets.all(height*0.01),
            child: Column(
              children: [

                SizedBox(height: height*0.03,),
                ListTile(
                  leading:
                  VariableText(text: "Notification Sound",
                    fontsize: height*0.023,
                    fontcolor: Color(0xff2B3E4F),
                    weight: FontWeight.normal,
                    fontFamily: 'sftr',),

                  trailing:Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: Color(0xff34C759),
                            activeColor:  themeColor2,
                          ),
                ),



                Spacer(),
                Padding(
                  padding:  EdgeInsets.only(bottom: height*0.03),
                  child:
                  CustomButton(
                      buttonHeight: height*0.07,
                      buttonWidth:width*0.90,
                      buttonBorderRadius:8,
                      buttonFontSize:height*0.025,
                      buttonColor:themeColor1,
                      buttonTextColor:themeColor2,
                      buttonText: "Save change",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                        Navigator.pop(context);  }
                  ),
                )





              ],
            ),
          ),
        );
    }
  }
}
