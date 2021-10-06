import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/global_variables.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'dart:math' as math;
import 'package:petzola/screens/appointment/appointmentrate_screen.dart';
import 'package:petzola/screens/home/home_page.dart';

import 'appointment_video_call_screen.dart';
class AppointmentDetailsScreen extends StatefulWidget {
  AppointmentModel appoinmnetDetailsdata;
  AppointmentDetailsScreen({this.appoinmnetDetailsdata});



  @override
  _AppointmentDetailsScreenState createState() => _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {

  int Selected=0;
  List<String> buttonText=["Reschedule","Cancel"];
  _onselected(int i){
    setState(() {
      Selected=i;
      });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AppointmentDetailsScreen();
  }
  Widget AppointmentDetailsScreen(){
    switch(MediaQuery.of(context).orientation){
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            titleSpacing: 0,
            centerTitle: true,
            leadingWidth: 65,
            title: VariableText(text: getTranslated(context, 'Appointment') , fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb',),
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
            actions: [
              InkWell(
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (_)=>HomePage(pageIndex: 2,)),(route)=>route.isCurrent);
                },
                child: SizedBox(
                  width: 26,
                  child: Image.asset("lib/assets/icons/home.png", color: Colors.black87,),
                ),
              ),
              SizedBox(width: 12),

              SizedBox(width: 16,),
            ],
          ),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: height*0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.01,),
                  AppointmentDetailsContainer(
                    doctorName:widget.appoinmnetDetailsdata.doctorName,
                    clinicName:widget.appoinmnetDetailsdata.clinicName,
                    rating:widget.appoinmnetDetailsdata.rating,
                    month:widget.appoinmnetDetailsdata.month,
                    image:widget.appoinmnetDetailsdata.image,
                    cWidth:width,
                    cHeight: height,
                    ontapVideoCall: (){
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>AppointmentVideoCallScreen(appoinmnetDetailsdata: widget.appoinmnetDetailsdata,)));
                    },),
                  SizedBox(height: height*0.08,),
                  VariableText(
                    text: getTranslated(context, "Date & Time"),
                    fontsize: 20,
                    fontFamily: 'sfdr',
                    fontcolor:
                    Color(0xFF2C3E50),
                  ),
                  SizedBox(height: height*0.02,),
                  Container(

                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  VariableText(
                                    text: "Sun, jan 19, at 08:00am - 08:30am",
                                    fontsize: 11,
                                    fontcolor: Color(0xFF2C3E50),
                                  ),
                                  Spacer(),
                                  Container(
                                    height:
                                    height * 0.04,
                                    width: width * 0.24,
                                    decoration: BoxDecoration(
                                        color: themeColor1,
                                        borderRadius:
                                        BorderRadius
                                            .circular(10)),
                                    child: Center(
                                      child: VariableText(
                                        text: getTranslated(context, 'Confirmed'),
                                        fontsize: 11,
                                        fontcolor: Colors.white,
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Row(
                    children: [
                      VariableText(
                        text:"Order Number",
                        fontsize: 11,
                        fontFamily: 'sftr',
                        fontcolor:
                        Color(0xFF2B3E4F),
                      ),
                      SizedBox(width: height*0.02,),
                      VariableText(
                        text:"#87364873",
                        fontsize: 11,
                        fontFamily: 'sftr',
                        fontcolor:
                        Color(0xFF2B3E4F),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  VariableText(
                    text: getTranslated(context, "For"),
                    fontsize: 20,
                    fontFamily: 'sfdr',
                    fontcolor:
                    Color(0xFF2C3E50),
                  ),
                  SizedBox(height: height*0.02,),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: height*0.03,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        //color: Colors.white,
                                        border: Border.all(color: Colors.white, width: 3)
                                    ),
                                    child: Image.asset(
                                      'lib/assets/images/appointment_pet.png',
                                      scale: 3.2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: height*0.02,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      VariableText(
                                        text: "Senba",
                                        fontsize: 20,
                                        fontcolor: Color(0xFF2C3E50),
                                        fontFamily: 'sfdr',
                                      ),
                                      VariableText(
                                        text: "Dog - Curly-Coated Retriever",
                                        fontsize: 11,
                                        fontcolor: Color(0xFF2C3E50),
                                        fontFamily: 'sftr',
                                      ),
                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  VariableText(
                    text: getTranslated(context, "Service Info"),
                    fontsize: 20,
                    fontFamily: 'sfdr',
                    fontcolor:
                    Color(0xFF2C3E50),
                  ),
                  SizedBox(height: height*0.02,),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.
                                      center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        VariableText(
                                          text: getTranslated(context, "Service Category:"),
                                          fontsize: 12,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                        VariableText(
                                          text: "Dental",
                                          fontsize: 15,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height*0.01,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.
                                      center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        VariableText(
                                          text: getTranslated(context, "Service:"),
                                          fontsize: 12,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                        VariableText(
                                          text: "Consultation",
                                          fontsize: 15,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height*0.01,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.
                                      center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        VariableText(
                                          text: getTranslated(context, "Service Location"),
                                          fontsize: 12,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                        VariableText(
                                          text: "Home",
                                          fontsize: 15,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height*0.01,),
                                  ],
                                )

                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  VariableText(
                    text: getTranslated(context, "Payment Details"),
                    fontsize: 20,
                    fontFamily: 'sfdr',
                    fontcolor:
                    Color(0xFF2C3E50),
                  ),
                  SizedBox(height: height*0.02,),
                  Container(

                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      VariableText(text: '389', fontsize:height*0.030,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                      SizedBox(width: height*0.0050,),
                                      Column(
                                        children: [
                                          SizedBox(height: height*0.025,),
                                          VariableText(text: 'Eg', fontsize: height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                        ],
                                      )

                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Image.asset('lib/assets/icons/visa.png',
                                        scale: 3.2,),
                                      SizedBox(width: height*0.02,),
                                      VariableText(text: '****', fontsize: height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),
                                      SizedBox(width: height*0.015,),
                                      VariableText(text: '4981', fontsize: height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),


                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Row(
                    children: [
                      VariableText(
                        text: getTranslated(context, "Payment Reference"),
                        fontsize: 11,
                        fontFamily: 'sftr',
                        fontcolor:
                        Color(0xFF2B3E4F),
                      ),
                      SizedBox(width: height*0.02,),
                      VariableText(
                        text:"#87364873",
                        fontsize: 11,
                        fontFamily: 'sftr',
                        fontcolor:
                        Color(0xFF2B3E4F),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  VariableText(
                    text: getTranslated(context, "History"),
                    fontsize: 20,
                    fontFamily: 'sfdr',
                    fontcolor:
                    Color(0xFF2C3E50),
                  ),
                  SizedBox(height: height*0.02,),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.
                                      center,

                                      children: [
                                        VariableText(
                                          text: getTranslated(context, "Order Request Time"),
                                          fontsize: 15,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                        Spacer(),
                                        VariableText(
                                          text: "12/01/1995",
                                          fontsize: 11,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                        SizedBox(width: height*0.01,),
                                        VariableText(
                                          text: "01:12 Pm",
                                          fontsize: 11,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height*0.01,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.
                                      center,

                                      children: [
                                        VariableText(
                                          text: getTranslated(context, "Payment Requested"),
                                          fontsize: 15,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                        Spacer(),
                                        VariableText(
                                          text: "12/01/1995",
                                          fontsize: 11,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                        SizedBox(width: height*0.01,),
                                        VariableText(
                                          text: "01:12 Pm",
                                          fontsize: 11,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                      ],
                                    ),


                                  ],
                                )

                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    List.generate(buttonText.length, (index){

                      return Row(

                        children: [

                          CustomButton(
                              buttonHeight: height*0.06,
                              buttonWidth:width*0.90,
                              buttonBorderRadius:8,
                              buttonFontSize:height*0.020,
                              buttonBorderColor:Selected==index?themeColor1:Color(0xffE8E8E8),
                              buttonColor: Selected==index?themeColor1:Color(0xffffffff),
                              buttonTextColor: Selected==index?themeColor2:Color(0xff2B3E4F),
                              buttonText: getTranslated(context, buttonText[index]),
                              buttonFontFamily:'sftr',
                              buttonOnTap:(){
                                _onselected(index);

                              }
                          ),
                          //SizedBox(width: 17,),






                        ],
                      );

                    }
                    ),
                  ),
                  SizedBox(height: height*0.04,),
                ],
              ),
            ),
          ),
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            titleSpacing: 0,
            centerTitle: true,
            leadingWidth: 65,
            title: VariableText(text: getTranslated(context, 'Appointment') , fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb',),
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
            actions: [
              InkWell(
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (_)=>HomePage(pageIndex: 2,)),(route)=>route.isCurrent);
                },
                child: SizedBox(
                  width: 26,
                  child: Image.asset("lib/assets/icons/home.png", color: Colors.black87,),
                ),
              ),
              SizedBox(width: 12),

              SizedBox(width: 16,),
            ],
          ),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: height*0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.01,),
                  AppointmentDetailsContainer(
                  doctorName:widget.appoinmnetDetailsdata.doctorName,
                  clinicName:widget.appoinmnetDetailsdata.clinicName,
                      rating:widget.appoinmnetDetailsdata.rating,
                  month:widget.appoinmnetDetailsdata.month,
                  image:widget.appoinmnetDetailsdata.image,
                      cWidth:width,
                      cHeight: height,
                  ontapVideoCall: (){
                    Navigator.push(context,MaterialPageRoute(builder: (_)=>AppointmentVideoCallScreen(appoinmnetDetailsdata: widget.appoinmnetDetailsdata,)));
                  },),
                  SizedBox(height: height*0.04,),
                  VariableText(
                    text: getTranslated(context, "Date & Time"),
                    fontsize: 20,
                    fontFamily: 'sfdr',
                    fontcolor:
                    Color(0xFF2C3E50),
                  ),
                  SizedBox(height: height*0.02,),
                  Container(

                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25.0,
                                  ),
                                  child: VariableText(
                                    text: "Sun, jan 19, at 08:00am - 08:30am",
                                    fontsize: 11,
                                    fontcolor: Color(0xFF2C3E50),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                      width * 0.05,
                                        right:height *
                                            0.02),
                                    child: Container(
                                      height:
                                     height * 0.04,
                                      width: width * 0.24,
                                      decoration: BoxDecoration(
                                          color: themeColor1,
                                          borderRadius:
                                          BorderRadius
                                              .circular(10)),
                                      child: Center(
                                        child: VariableText(
                                          text: getTranslated(context, 'Confirmed'),
                                          fontsize: 11,
                                          fontcolor: Colors.white,
                                        ),
                                      ),
                                    )),
                                Spacer(),

                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Row(
                    children: [
                      VariableText(
                        text:"Order Number",
                        fontsize: 11,
                        fontFamily: 'sftr',
                        fontcolor:
                        Color(0xFF2B3E4F),
                      ),
                      SizedBox(width: height*0.02,),
                      VariableText(
                        text:"#87364873",
                        fontsize: 11,
                        fontFamily: 'sftr',
                        fontcolor:
                        Color(0xFF2B3E4F),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  VariableText(
                    text: getTranslated(context, "For"),
                    fontsize: 20,
                    fontFamily: 'sfdr',
                    fontcolor:
                    Color(0xFF2C3E50),
                  ),
                  SizedBox(height: height*0.02,),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: height*0.03,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        //color: Colors.white,
                                        border: Border.all(color: Colors.white, width: 3)
                                    ),
                                    child: Image.asset(
                                      'lib/assets/images/appointment_pet.png',
                                      scale: 3.2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: height*0.02,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      VariableText(
                                        text: "Senba",
                                        fontsize: 20,
                                        fontcolor: Color(0xFF2C3E50),
                                        fontFamily: 'sfdr',
                                      ),
                                      VariableText(
                                        text: "Dog - Curly-Coated Retriever",
                                        fontsize: 11,
                                        fontcolor: Color(0xFF2C3E50),
                                        fontFamily: 'sftr',
                                      ),
                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  VariableText(
                    text: getTranslated(context, "Service Info"),
                    fontsize: 20,
                    fontFamily: 'sfdr',
                    fontcolor:
                    Color(0xFF2C3E50),
                  ),
                  SizedBox(height: height*0.02,),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.
                                    center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      VariableText(
                                        text: getTranslated(context, "Service Category:"),
                                        fontsize: 12,
                                        fontcolor: Color(0xFF2B3E4F),
                                        fontFamily: 'sftr',
                                      ),
                                      VariableText(
                                        text: "Dental",
                                        fontsize: 15,
                                        fontcolor: Color(0xFF2B3E4F),
                                        fontFamily: 'sftr',
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height*0.01,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.
                                    center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      VariableText(
                                        text: getTranslated(context, "Service:"),
                                        fontsize: 12,
                                        fontcolor: Color(0xFF2B3E4F),
                                        fontFamily: 'sftr',
                                      ),
                                      VariableText(
                                        text: "Consultation",
                                        fontsize: 15,
                                        fontcolor: Color(0xFF2B3E4F),
                                        fontFamily: 'sftr',
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height*0.01,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.
                                    center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      VariableText(
                                        text: getTranslated(context, "Service Location"),
                                        fontsize: 12,
                                        fontcolor: Color(0xFF2B3E4F),
                                        fontFamily: 'sftr',
                                      ),
                                      VariableText(
                                        text: "Home",
                                        fontsize: 15,
                                        fontcolor: Color(0xFF2B3E4F),
                                        fontFamily: 'sftr',
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height*0.01,),
                                ],
                              )

                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  VariableText(
                    text: getTranslated(context, "Payment Details"),
                    fontsize: 20,
                    fontFamily: 'sfdr',
                    fontcolor:
                    Color(0xFF2C3E50),
                  ),
                  SizedBox(height: height*0.02,),
                  Container(

                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      VariableText(text: '389', fontsize:height*0.030,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                      SizedBox(width: height*0.0050,),
                                      Column(
                                        children: [
                                          SizedBox(height: height*0.025,),
                                          VariableText(text: 'Eg', fontsize: height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                        ],
                                      )

                                    ],
                                  ),
                                  Spacer(),
                              Row(
                                children: [
                                  Image.asset('lib/assets/icons/visa.png',
                              scale: 3.2,),
                                  SizedBox(width: height*0.02,),
                                  VariableText(text: '****', fontsize: height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),
                                  SizedBox(width: height*0.015,),
                                  VariableText(text: '4981', fontsize: height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),


                                ],
                              )

                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Row(
                    children: [
                      VariableText(
                        text: getTranslated(context, "Payment Reference"),
                        fontsize: 11,
                        fontFamily: 'sftr',
                        fontcolor:
                        Color(0xFF2B3E4F),
                      ),
                      SizedBox(width: height*0.02,),
                      VariableText(
                        text:"#87364873",
                        fontsize: 11,
                        fontFamily: 'sftr',
                        fontcolor:
                        Color(0xFF2B3E4F),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  VariableText(
                    text: getTranslated(context, "History"),
                    fontsize: 20,
                    fontFamily: 'sfdr',
                    fontcolor:
                    Color(0xFF2C3E50),
                  ),
                  SizedBox(height: height*0.02,),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.
                                      center,

                                      children: [
                                        VariableText(
                                          text: getTranslated(context, "Order Request Time"),
                                          fontsize: 15,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                        Spacer(),
                                        VariableText(
                                          text: "12/01/1995",
                                          fontsize: 11,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                        SizedBox(width: height*0.01,),
                                        VariableText(
                                          text: "01:12 Pm",
                                          fontsize: 11,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height*0.01,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.
                                      center,

                                      children: [
                                        VariableText(
                                          text: getTranslated(context, "Payment Requested"),
                                          fontsize: 15,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                        Spacer(),
                                        VariableText(
                                          text: "12/01/1995",
                                          fontsize: 11,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                        SizedBox(width: height*0.01,),
                                        VariableText(
                                          text: "01:12 Pm",
                                          fontsize: 11,
                                          fontcolor: Color(0xFF2B3E4F),
                                          fontFamily: 'sftr',
                                        ),
                                      ],
                                    ),


                                  ],
                                )

                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    List.generate(buttonText.length, (index){

                      return Row(

                        children: [

                          CustomButton(
                              buttonHeight: height*0.06,
                              buttonWidth:width*0.39,
                              buttonBorderRadius:8,
                              buttonFontSize:height*0.020,
                          buttonBorderColor:Selected==index?themeColor1:Color(0xffE8E8E8),
                              buttonColor: Selected==index?themeColor1:Color(0xffffffff),
                              buttonTextColor: Selected==index?themeColor2:Color(0xff2B3E4F),
                              buttonText: getTranslated(context, buttonText[index]),
                              buttonFontFamily:'sftr',
                              buttonOnTap:(){
                                _onselected(index);

                              }
                          ),
                          //SizedBox(width: 17,),






                        ],
                      );

                    }
                    ),
                  ),
                  SizedBox(height: height*0.04,),
                ],
              ),
            ),
          ),
        );
    }
  }
}
