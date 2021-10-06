import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/models/chatMessageModel.dart';

import 'appointment_complelete_screen.dart';
class AppointmentVideoCallScreen extends StatefulWidget {
  AppointmentModel appoinmnetDetailsdata;
  AppointmentVideoCallScreen({this.appoinmnetDetailsdata});

  @override
  _AppointmentVideoCallScreenState createState() => _AppointmentVideoCallScreenState();
}

class _AppointmentVideoCallScreenState extends State<AppointmentVideoCallScreen> {
  List<ChatMessage> messages = [
    ChatMessage(
      messageContent: "Medical Prescription.Pdf",),

  ];
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppointmentVideoCallScreen();
  }
Widget AppointmentVideoCallScreen() {

  switch (MediaQuery
      .of(context)
      .orientation) {
    case Orientation.landscape:
      double width=MediaQuery.of(context).size.height;
      double height=MediaQuery.of(context).size.width;
      return Scaffold(
        backgroundColor: themeColor2,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Container(
                  height: height*0.70,
                  width: height,

                  decoration: BoxDecoration(
                    //color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(
                            'lib/assets/images/doggif.gif'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),bottomLeft: Radius.circular(8))
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.07,),
                        Align(
                          alignment:Alignment.bottomRight,
                          child: Stack(
                            children: [
                              Container(
                                height: height*0.16,
                                width: width*0.28,
                                decoration: BoxDecoration(

                                    image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/images/doctorgif.gif'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top:height*0.13,left:height*0.05),
                                child: Container(
                                  height: 30,
                                  width:30,
                                  decoration: BoxDecoration(
                                    color: themeColor2,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: textColor),
                                  ),
                                  child: Image.asset('lib/assets/icons/videocall_camera.png',scale: 4.5,),

                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: height*0.17,),
                        VariableText(text: "Dermatologists",
                          fontsize: 13,
                          fontcolor: themeColor2,
                          fontFamily: 'sftr',),
                        SizedBox(height: height*0.0055,),
                        VariableText(text: "Dr Helay Lawernce",
                          fontsize: 20,
                          fontcolor: themeColor2,
                          fontFamily: 'sfdr',),
                        SizedBox(height: height*0.03,),
                        Container(
                          height: height*0.06,
                          width: width*0.25,
                          decoration: BoxDecoration(
                            color: themeColor2,

                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('lib/assets/icons/reddot.png',scale: 3.4,),
                              VariableText(text: "7.33",
                                fontsize: 12,
                                fontcolor: textColor,
                                fontFamily: 'sftr',),
                            ],
                          ),
                        ),
                        SizedBox(height: height*0.04,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: height*0.05,
                                width: height*0.05,
                                decoration: BoxDecoration(
                                  color: Color(0xffF8F9FA),
                                  borderRadius:BorderRadius.circular(50),
                                ),
                                child:Image.asset('lib/assets/icons/micoff.png',scale: 5.5,)
                            ),
                            SizedBox(width: height*0.02,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>AppointmentCompleteScreen(appoinmnetDetailsdata: widget.appoinmnetDetailsdata,)));

                              },
                              child: Container(
                                  height: height*0.075,
                                  width: height*0.075,
                                  decoration: BoxDecoration(
                                    color: Color(0xffD35151),
                                    borderRadius:BorderRadius.circular(50),
                                  ),
                                  child:Image.asset('lib/assets/icons/callwhiteicon.png',scale: 3.5,)
                              ),
                            ), SizedBox(width:height*0.02,),
                            Container(
                                height: height*0.05,
                                width: height*0.05,
                                decoration: BoxDecoration(
                                  color: Color(0xffF8F9FA),
                                  borderRadius:BorderRadius.circular(50),
                                ),
                                child:Image.asset('lib/assets/icons/videocallicon.png',scale: 5.5,)
                            ),],
                        ),


                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: height*0.01,
                        left: height*0.025
                    ),
                    child: ListView.builder(
                      itemCount: messages.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10, bottom: 10),

                      itemBuilder: (context, index) {
                        return (
                            Column(

                              children: [
                                Stack(
                                  children: [
                                    Container(

                                      padding:
                                      EdgeInsets.only(left: 24, right: 0, top: 0, bottom: 0),
                                      child: Align(
                                        alignment: (Alignment.topLeft),
                                        child:
                                        Container(
                                          height:height*0.08,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Color(0xffF0F5FC),
                                          ),
                                          padding: EdgeInsets.only(top: 22,bottom:0,left: 16,right: 16),
                                          child:

                                          Text(
                                            messages[index].messageContent,
                                            style: TextStyle(fontSize: 13,fontFamily: 'sftr',color: textColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left:0,
                                      top:8,
                                      child:    Container(
                                        height: 40,width: 40,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/icons/doctorchaticon.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          //  shape: BoxShape.circle,

                                          border: Border.all(color: themeColor2, width:2),
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding:
                                  EdgeInsets.only(left: width*0.07, right: 0, top: height*0.01, bottom: 0),
                                  child: Align(
                                    alignment: ( Alignment.topLeft),
                                    child: Container(
                                        child:VariableText(text: "11:17Am",fontsize: 11,fontFamily: 'sftr',fontcolor:hinttextColor)),
                                  ),
                                ),


                                SizedBox(height: height*0.03,),


                              ],
                            )

                        )
                        ;
                      },
                    ),
                  ),
                ),


                Padding(
                  padding:  EdgeInsets.only(bottom: height*0.02,left: height*0.025,right: height*0.025),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                              height: height*0.08,

                              decoration:  BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(height*0.02) //                 <--- border radius here
                                ),
                              ),
                              child:Row(
                                children: [
                                  Expanded(
                                      flex:2,
                                      child: Container(
                                          height: height*0.06,
                                          child: Image.asset("lib/assets/icons/cameraicon.png",scale:height*0.005,))),
                                  Expanded(
                                    flex:12,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                                      height:height*0.06,


                                      child:
                                      Padding(
                                        padding:  EdgeInsets.all(height*0.002),
                                        child: TextField(
                                          controller: _controller,
                                          style:  TextStyle(color: Color(0xff2B3E4F),
                                              fontSize:height*0.015,fontFamily: 'sftr'),

                                          decoration: InputDecoration(
                                              hintText: "Write your message…",
                                              hintStyle: TextStyle(color: Color(0xfc3C3C43),
                                                  fontSize:height*0.015,fontFamily: 'sftr'),

                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                      flex:2,
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {
                                            messages.add(ChatMessage(
                                              messageContent: _controller.text,
                                            ));
                                            _controller.clear();

                                          });},
                                        child: Container(
                                            height: height*0.06,
                                            child: Image.asset("lib/assets/icons/chatsend.png",scale:height*0.005,)),
                                      )),
                                ],
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    case Orientation.portrait:
      double height=MediaQuery.of(context).size.height;
      double width=MediaQuery.of(context).size.width;
      return Scaffold(
      //  resizeToAvoidBottomInset: false,
        backgroundColor: themeColor2,
        body: SingleChildScrollView(

          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  height: height*0.70,
                  width: width,

                  decoration: BoxDecoration(
                      //color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(
                          'lib/assets/images/doggif.gif'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8))
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.07,),
                        Align(
                          alignment:Alignment.bottomRight,
                          child: Stack(
                            children: [
                              Container(
                                height: height*0.16,
                                width: width*0.28,
                                decoration: BoxDecoration(

                                    image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/images/doctorgif.gif'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top:height*0.13,left:height*0.05),
                                child: Container(
                                  height: 30,
                                  width:30,
                                  decoration: BoxDecoration(
                                    color: themeColor2,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: textColor),
                                  ),
                                  child: Image.asset('lib/assets/icons/videocall_camera.png',scale: 4.5,),

                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: height*0.17,),
                        VariableText(text: "Dermatologists",
                          fontsize: 13,
                          fontcolor: themeColor2,
                          fontFamily: 'sftr',),
                        SizedBox(height: height*0.0055,),
                        VariableText(text: "Dr Helay Lawernce",
                          fontsize: 20,
                          fontcolor: themeColor2,
                          fontFamily: 'sfdr',),
                        SizedBox(height: height*0.03,),
                        Container(
                          height: height*0.06,
                          width: width*0.25,
                          decoration: BoxDecoration(
                            color: themeColor2,

                              borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('lib/assets/icons/reddot.png',scale: 3.4,),
                              VariableText(text: "7.33",
                                fontsize: 12,
                                fontcolor: textColor,
                                fontFamily: 'sftr',),
                            ],
                          ),
                        ),
                        SizedBox(height: height*0.04,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: height*0.05,
                                width: height*0.05,
                                decoration: BoxDecoration(
                                  color: Color(0xffF8F9FA),
                                  borderRadius:BorderRadius.circular(50),
                                ),
                                child:Image.asset('lib/assets/icons/micoff.png',scale: 5.5,)
                            ),
                            SizedBox(width: height*0.02,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>AppointmentCompleteScreen(appoinmnetDetailsdata: widget.appoinmnetDetailsdata,)));

                              },
                              child: Container(
                                  height: height*0.075,
                                  width: height*0.075,
                                  decoration: BoxDecoration(
                                    color: Color(0xffD35151),
                                    borderRadius:BorderRadius.circular(50),
                                  ),
                                  child:Image.asset('lib/assets/icons/callwhiteicon.png',scale: 3.5,)
                              ),
                            ), SizedBox(width:height*0.02,),
                            Container(
                                height: height*0.05,
                                width: height*0.05,
                                decoration: BoxDecoration(
                                  color: Color(0xffF8F9FA),
                                  borderRadius:BorderRadius.circular(50),
                                ),
                                child:Image.asset('lib/assets/icons/videocallicon.png',scale: 5.5,)
                            ),],
                        ),


                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: height*0.01,
                        left: height*0.025
                    ),
                    child: ListView.builder(
                      itemCount: messages.length,
                      scrollDirection: Axis.vertical,
                     // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      //physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return (
                            Column(

                              children: [
                                Stack(
                                  children: [
                                    Container(

                                      padding:
                                      EdgeInsets.only(left: 24, right: 0, top: 0, bottom: 0),
                                      child: Align(
                                        alignment: (Alignment.topLeft),
                                        child:
                                        Container(
                                          height:height*0.08,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Color(0xffF0F5FC),
                                          ),
                                          padding: EdgeInsets.only(top: 22,bottom:0,left: 16,right: 16),
                                          child:

                                          Text(
                                            messages[index].messageContent,
                                            style: TextStyle(fontSize: 13,fontFamily: 'sftr',color: textColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left:0,
                                      top:8,
                                      child:    Container(
                                        height: 40,width: 40,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/icons/doctorchaticon.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          //  shape: BoxShape.circle,

                                          border: Border.all(color: themeColor2, width:2),
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding:
                                  EdgeInsets.only(left: width*0.07, right: 0, top: height*0.01, bottom: 0),
                                  child: Align(
                                    alignment: ( Alignment.topLeft),
                                    child: Container(
                                        child:VariableText(text: "11:17Am",fontsize: 11,fontFamily: 'sftr',fontcolor:hinttextColor)),
                                  ),
                                ),


                                SizedBox(height: height*0.03,),


                              ],
                            )

                        )
                        ;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                              height: height*0.08,

                              decoration:  BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(height*0.02) //                 <--- border radius here
                                ),
                              ),
                              child:Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex:2,
                                        child: Container(
                                            height:height*0.06,
                                            child: Image.asset("lib/assets/icons/cameraicon.png",scale:height*0.0035))),
                                    Expanded(
                                      flex:12,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                                        height:height*0.06,


                                        child:
                                        Padding(
                                          padding:  EdgeInsets.all(height*0.002),
                                          child: TextField(
                                            controller: _controller,
                                            style:  TextStyle(color: Color(0xff2B3E4F),
                                                fontSize:height*0.015,fontFamily: 'sftr'),

                                            decoration: InputDecoration(
                                                hintText: "Write your message…",
                                                hintStyle: TextStyle(color: Color(0xfc3C3C43),
                                                    fontSize:height*0.015,fontFamily: 'sftr'),

                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                        flex:2,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              messages.add(ChatMessage(
                                                messageContent: _controller.text,
                                              ));
                                              _controller.clear();

                                            });},
                                          child: Container(
                                              height:height*0.06,
                                              child: Image.asset("lib/assets/icons/chatsend.png",scale:height*0.004,)),
                                        )),
                                  ],
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                )



               /* Padding(
                  padding:  EdgeInsets.only(bottom: height*0.02,left: height*0.025,right: height*0.025),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                              height: height*0.08,

                              decoration:  BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(height*0.02) //                 <--- border radius here
                                ),
                              ),
                              child:Row(
                                children: [
                                  Expanded(
                                      flex:2,
                                      child: Container(
                                          height: height*0.06,
                                          child: Image.asset("lib/assets/icons/cameraicon.png",scale:height*0.005,))),
                                  Expanded(
                                    flex:10,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                                      height:height*0.06,


                                      child:
                                      Padding(
                                        padding:  EdgeInsets.all(height*0.002),
                                        child: TextField(
                                          controller: _controller,
                                          style:  TextStyle(color: Color(0xff2B3E4F),
                                              fontSize:height*0.015,fontFamily: 'sftr'),

                                          decoration: InputDecoration(
                                              hintText: "Write A Comment",
                                              hintStyle: TextStyle(color: Color(0xfc3C3C43),
                                                  fontSize:height*0.015,fontFamily: 'sftr'),

                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                      flex:3,
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {
                                            messages.add(ChatMessage(
                                              messageContent: _controller.text,
                                            ));
                                            _controller.clear();

                                          });},
                                        child: Container(
                                            height: height*0.06,
                                            child: Image.asset("lib/assets/icons/chatsend.png",scale:height*0.005,)),
                                      )),
                                ],
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                )*/
              ],
            ),
          ),
        ),
      );
  }
}
}
