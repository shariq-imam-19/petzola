import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/models/cities_model.dart';
import 'package:petzola/screens/home/home_page.dart';
import 'package:petzola/screens/home/schedule_screen.dart';
class AddCreditCardScreen extends StatefulWidget {

  @override
  _AddCreditCardScreenState createState() => _AddCreditCardScreenState();
}

class _AddCreditCardScreenState extends State<AddCreditCardScreen> {


  bool isSwitched=true;


  @override
  Widget build(BuildContext context) {
    return ContactusScreen();
  }
  Widget ContactusScreen() {

    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: PreferredSize(

            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarHome(size: height,title: "Payment Credit Card",),
          ),
          backgroundColor: themeColor2,
          body:   SingleChildScrollView(
              physics: ClampingScrollPhysics(parent: ScrollPhysics()),
              child:
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: height*0.02,),
                      Center(
                        child: Container(
                          height: height*0.25,
                          width: width*0.70,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'lib/assets/images/creditcard.png'
                                  ),
                                  fit: BoxFit.fill
                              )
                          ),




                        ),
                      ),
                      SizedBox(height: height*0.08,),
                      RectangluartextFeild(
                        heights: height*0.07,
                        widths: height*0.95,
                        hinttext: getTranslated(context, "Name"),
                        fontsize: height*0.019,
                        keytype: TextInputType.text,
                      ),
                      SizedBox(height: height*0.02,),
                      RectangluartextFeild(
                        heights: height*0.07,
                        widths: height*0.95,
                        hinttext: getTranslated(context, "Card Number"),
                        fontsize: height*0.019,
                        keytype: TextInputType.number,
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child:   RectangluartextFeild(
                              heights: height*0.07,

                              hinttext: "0/5",
                              fontsize: height*0.019,
                              keytype: TextInputType.number,
                            ),),
                          SizedBox(width: height*0.02,),
                          Expanded(
                            flex: 2,
                            child:   RectangluartextFeild(
                              heights: height*0.07,

                              hinttext: "2025",
                              fontsize: height*0.019,

                              keytype: TextInputType.number,
                            ),),
                          SizedBox(width: height*0.04,),
                          Expanded(
                            flex: 1,
                            child:   RectangluartextFeild(
                              heights: height*0.07,

                              hinttext: "Cvc",
                              fontsize: height*0.019,
                              keytype: TextInputType.number,
                            ),),


                        ],
                      ),
                      SizedBox(height: height*0.03,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Switch(
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
                          VariableText(text: getTranslated(context, "Save Card"),
                            fontsize: 15,
                            fontcolor: Color(0xff2B3E4F),
                            weight: FontWeight.normal,
                            fontFamily: 'sftr',),

                        ],
                      ),
                      SizedBox(height: height*0.10,),


                    ]
                ),
              )
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(height: height * 0.10,
              color: themeColor2,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                child:
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                          buttonHeight: height*0.07,

                          buttonBorderRadius:8,
                          buttonFontSize:height*0.025,
                          buttonColor:themeColor3,
                          buttonTextColor:themeColor2,
                          buttonText: "Payment Now 393 Eg",
                          buttonFontFamily:'sfdm',
                          buttonOnTap:(){
                            showDialog(height,width);   }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
         return Scaffold(
           resizeToAvoidBottomInset: true,
           appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: CustomAppBarHome(size: height,title: "Payment Credit Card",),
            ),
            backgroundColor: themeColor2,
            body:
            LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child:
                  ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(height: height*0.02,),
                                Center(
                                  child: Container(
                                    height: height*0.25,
                                    width: width*0.70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/images/creditcard.png'
                                            ),
                                            fit: BoxFit.fill
                                        )
                                    ),




                                  ),
                                ),
                                SizedBox(height: height*0.08,),
                                RectangluartextFeild(
                                  heights: height*0.07,
                                  widths: width*0.90,
                                  hinttext: getTranslated(context, "Name"),
                                  fontsize: height*0.019,
                                  keytype: TextInputType.text,
                                ),
                                SizedBox(height: height*0.02,),
                                RectangluartextFeild(
                                  heights: height*0.07,
                                  widths: width*0.90,
                                  hinttext: getTranslated(context, "Card Number"),
                                  fontsize: height*0.019,
                                  keytype: TextInputType.number,
                                ),
                                SizedBox(height: height*0.02,),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child:   RectangluartextFeild(
                                          heights: height*0.07,

                                          hinttext: "0/5",
                                          fontsize: height*0.019,
                                          keytype: TextInputType.number,
                                        ),),
                                    SizedBox(width: height*0.02,),
                                    Expanded(
                                      flex: 2,
                                      child:   RectangluartextFeild(
                                        heights: height*0.07,

                                        hinttext: "2025",
                                        fontsize: height*0.019,
                                        
                                        keytype: TextInputType.number,
                                      ),),
                                    SizedBox(width: height*0.04,),
                                    Expanded(
                                      flex: 1,
                                      child:   RectangluartextFeild(
                                        heights: height*0.07,

                                        hinttext: "Cvc",
                                        fontsize: height*0.019,
                                        keytype: TextInputType.number,
                                      ),),


                                  ],
                                ),
                                SizedBox(height: height*0.03,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Switch(
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
                                    VariableText(text: getTranslated(context, "Save Card"),
                                      fontsize: 15,
                                      fontcolor: Color(0xff2B3E4F),
                                      weight: FontWeight.normal,
                                      fontFamily: 'sftr',),

                                  ],
                                ),


                              ]
                          ),
                        ),
                      )
                  )
              );
            }),
           bottomNavigationBar: BottomAppBar(
             child: Container(height: height * 0.10,
               color: themeColor2,
               child: Padding(
                 padding:  EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                 child:
                 Row(
                   children: [
                     Expanded(
                       child: CustomButton(
                           buttonHeight: height*0.07,

                           buttonBorderRadius:8,
                           buttonFontSize:height*0.025,
                           buttonColor:themeColor3,
                           buttonTextColor:themeColor2,
                           buttonText: "Payment Now 393 Eg",
                           buttonFontFamily:'sfdm',
                           buttonOnTap:(){
                             showDialog(height,width); }
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
        );
    }
  }
  void showDialog(double height,double width) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return ShowPaymentDialouge(height: height,width: width,);
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}
class ShowPaymentDialouge extends StatelessWidget {
double height,width;
ShowPaymentDialouge({this.height,this.width});

  @override
  Widget build(BuildContext context) {

    Future<bool> _onBackPressed() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text( getTranslated(context, 'Are you sure?')),
            content: Text(getTranslated(context, 'Do you want to exit an App')),
            actions: <Widget>[
              FlatButton(
                child: Text(getTranslated(context, 'No')),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(getTranslated(context, 'Yes')),
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
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return WillPopScope(
          onWillPop: _onBackPressed,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
              child: Container(


                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage('lib/assets/icons/dialougebg.png'),
                            )
                        ),
                        height: height*0.30,
                        child: Column(
                          children: [
                            SizedBox(height: height*0.03,),
                            VariableText(text: getTranslated(context, "Booked Successfully"),
                              fontsize: 20,
                              fontcolor: Color(0xff2B3E4F),
                              fontFamily: 'sfdr',),
                            SizedBox(height: height*0.03,),
                            Center(
                              child: Container(
                                child: CircleAvatar(
                                  radius: height*0.07,
                                  backgroundColor: Color(0xffEAF0F9),
                                  backgroundImage: AssetImage('lib/assets/icons/circlecat.png'),
                                ),
                              ),
                            ),
                            SizedBox(height: height*0.02,),
                            VariableText(text: "Kathy",
                              fontsize: 20,
                              fontcolor: Color(0xff2B3E4F),
                              fontFamily: 'sfdr',),
                          ],
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          decoration: BoxDecoration(


                          ),
                          height: height*0.50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //image
                                      Stack(
                                        children: [
                                          Container(
                                              height: height*0.20,
                                              width:width*0.26,


                                              child: Image.asset('lib/assets/icons/doctoricon.png', scale: 2.3)),
                                          Container(
                                            height: height*0.23,
                                            width:width*0.27,
                                            child:Image.asset('lib/assets/icons/onlineicon.png', scale: 2.3) ,

                                            //color: Colors.red,

                                          ),



                                        ],
                                      ),
                                      //name address
                                      Padding(
                                        padding:  EdgeInsets.only(left: 8.0),
                                        child: Container(

                                          height: height*0.20,
                                          //width: width,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height:height*0.05,),
                                              //name & rating
                                              Row(
                                                children: [
                                                  VariableText(text: 'Bobby Clark', fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                                                  Padding(
                                                    padding: EdgeInsets.only( left: 10.0),
                                                    child: VariableText(text: '4.8', fontsize: 11, fontcolor: Color(0xFF2C3E50),),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only( left: 1.0, bottom: 5.0),
                                                    child: Image.asset('lib/assets/icons/appointment_rating.png', scale: 4.2,color: Color(0xff707070),),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: height*0.01,),
                                              VariableText(text: 'Senior Cordiologist And Surgeon', fontsize:height*0.015, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                                              SizedBox(height: height*0.01,),
                                              //address
                                              Row(
                                                children: [
                                                  Image.asset('lib/assets/icons/appointment_clinic.png', scale: 3.2,),
                                                  SizedBox(width: 10,),
                                                  VariableText(text: 'United States Medical College', fontsize: 12,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                                ],
                                              ),
                                              SizedBox(height:height*0.019,),
                                              //address
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only( right:height*0.01),

                                                    child:  VariableText(text: 'Perth:', fontsize: height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                                  ),
                                                  VariableText(text: 'El Metro', fontsize: height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                SizedBox(height: height*0.02,),
                              Row(
                                children: [
                                  Expanded(child:   Container(
                                    height: height*0.07,

                                    decoration:BoxDecoration(
                                      color: Color(0xffF0F5FC),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child:
                                      VariableText(text: "Sun, Jan 19, At 08:00Am",
                                        fontsize: 13,
                                        fontcolor: Color(0xff2B3E4F),
                                        fontFamily: 'sftr',),
                                    ),
                                  ),)
                                ],
                              ),
                                SizedBox(height: height*0.02,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    VariableText(text: "Order Number",
                                      fontsize: 11,
                                      fontcolor: Color(0xff2B3E4F),
                                      fontFamily: 'sftr',),
                                    SizedBox(width: height*0.02,),
                                    VariableText(text: "#87364873",
                                      fontsize: 13,
                                      fontcolor: Color(0xff2B3E4F),
                                      fontFamily: 'sftr',),

                                  ],
                                ),
                                SizedBox(height: height*0.03,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushAndRemoveUntil(
                                        context, MaterialPageRoute(builder: (_)=>HomePage(pageIndex: 1,)),(route)=>route.isCurrent);

                                  },
                                  child: Row(
                                    children: [
                                      Expanded(child:

                                      Container(
                                        height: height*0.07,

                                        decoration:BoxDecoration(
                                          color:themeColor1,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child:
                                          VariableText(text: getTranslated(context, "Manage Appointment"),
                                            fontsize: 20,
                                            fontcolor:themeColor2,
                                            fontFamily: 'sfdm',),
                                        ),
                                      ), )
                                    ],
                                  ),
                                )


                              ],
                            ),
                          ),

                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      case Orientation.portrait:
        return WillPopScope(
          onWillPop: _onBackPressed,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
              child: Container(
                height: height*0.80,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage('lib/assets/icons/dialougebg.png'),
                          )
                      ),
                      height: height*0.30,
                      child: Column(
                        children: [
                          SizedBox(height: height*0.03,),
                          VariableText(text: getTranslated(context, "Booked Successfully"),
                            fontsize: 20,
                            fontcolor: Color(0xff2B3E4F),
                            fontFamily: 'sfdr',),
                          SizedBox(height: height*0.03,),
                          Center(
                            child: Container(
                              child: CircleAvatar(
                                radius: height*0.07,
                                backgroundColor: Color(0xffEAF0F9),
                                backgroundImage: AssetImage('lib/assets/icons/circlecat.png'),
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.02,),
                          VariableText(text: "Kathy",
                            fontsize: 20,
                            fontcolor: Color(0xff2B3E4F),
                            fontFamily: 'sfdr',),
                        ],
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(


                        ),
                        height: height*0.50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //image
                                    Stack(
                                      children: [
                                        Container(
                                            height: height*0.20,
                                            width:width*0.26,


                                            child: Image.asset('lib/assets/icons/doctoricon.png', scale: 2.3)),
                                        Container(
                                          height: height*0.23,
                                          width:width*0.27,
                                          child:Image.asset('lib/assets/icons/onlineicon.png', scale: 2.3) ,

                                          //color: Colors.red,

                                        ),



                                      ],
                                    ),
                                    //name address
                                    Padding(
                                      padding:  EdgeInsets.only(left: 8.0),
                                      child: Container(

                                        height: height*0.20,
                                        //width: width,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height:height*0.05,),
                                            //name & rating
                                            Row(
                                              children: [
                                                VariableText(text: 'Bobby Clark', fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                                                Padding(
                                                  padding: EdgeInsets.only( left: 10.0),
                                                  child: VariableText(text: '4.8', fontsize: 11, fontcolor: Color(0xFF2C3E50),),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only( left: 1.0, bottom: 5.0),
                                                  child: Image.asset('lib/assets/icons/appointment_rating.png', scale: 4.2,color: Color(0xff707070),),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: height*0.01,),
                                            VariableText(text: 'Senior Cordiologist And Surgeon', fontsize:height*0.015, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                                            SizedBox(height: height*0.01,),
                                            //address
                                            Row(
                                              children: [
                                                Image.asset('lib/assets/icons/appointment_clinic.png', scale: 3.2,),
                                                SizedBox(width: 10,),
                                                VariableText(text: 'United States Medical College', fontsize: 12,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                              ],
                                            ),
                                            SizedBox(height:height*0.019,),
                                            //address
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only( right:height*0.01),

                                                  child:  VariableText(text: 'Perth:', fontsize: height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                                ),
                                                VariableText(text: 'El Metro', fontsize: height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: height*0.02,),
                              Container(
                                height: height*0.07,
                                width: width*0.90,
                                decoration:BoxDecoration(
                                  color: Color(0xffF0F5FC),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child:
                                  VariableText(text: "Sun, Jan 19, At 08:00Am",
                                    fontsize: 13,
                                    fontcolor: Color(0xff2B3E4F),
                                    fontFamily: 'sftr',),
                                ),
                              ),
                              SizedBox(height: height*0.02,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VariableText(text: "Order Number",
                                    fontsize: 11,
                                    fontcolor: Color(0xff2B3E4F),
                                    fontFamily: 'sftr',),
                                  SizedBox(width: height*0.02,),
                                  VariableText(text: "#87364873",
                                    fontsize: 13,
                                    fontcolor: Color(0xff2B3E4F),
                                    fontFamily: 'sftr',),

                                ],
                              ),
                              SizedBox(height: height*0.03,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushAndRemoveUntil(
                                      context, MaterialPageRoute(builder: (_)=>HomePage(pageIndex: 1,)),(route)=>route.isCurrent);

                                },
                                child: Row(
                                  children: [
                                    Expanded(child:

                                    Container(
                                      height: height*0.07,

                                      decoration:BoxDecoration(
                                        color:themeColor1,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child:
                                        VariableText(text: getTranslated(context, "Manage Appointment"),
                                          fontsize: 20,
                                          fontcolor:themeColor2,
                                          fontFamily: 'sfdm',),
                                      ),
                                    ), )
                                  ],
                                ),
                              )


                            ],
                          ),
                        ),

                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
    }

  }
}

