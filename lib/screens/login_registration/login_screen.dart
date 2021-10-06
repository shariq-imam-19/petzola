import 'dart:math';

import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/screens/home/home_page.dart';

import 'package:petzola/screens/home/home_screen.dart';
import 'package:petzola/screens/login_registration/forget_password_screen.dart';
import 'package:petzola/screens/login_registration/sign_up_screen.dart';
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool viewPassword=true;
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
  Widget LoginScreen() {
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    bottom = max(min(bottom, 80), 0);
    bool _checkbox = false;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(

            child: Padding(
              padding:  EdgeInsets.all(width*0.01),
              child: Column(
                children: [
                  CustomApploginRegistration(ontap: (){
                    Navigator.pop(context);
                  },size: width,text: "Login",),
                  SizedBox(height: width*0.08,),
                  Center(
                    child: Container(
                      height: width*0.08,
                      width: height*0.25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/icons/splashlogo.png'
                              ),
                              fit: BoxFit.fill
                          )
                      ),


                    ),
                  ),
                  SizedBox(height: width*0.03,),
                  Center(
                    child:
                    VariableText(text: "Let’s Sign You In.",
                      fontsize: width*0.025,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),

                  SizedBox(height: width*0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        height: width*0.065,
                        width: height*0.13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffEAF0F9)
                        ),
                        child:
                        Padding(
                          padding:  EdgeInsets.all(width*0.02),
                          child: Image(
                            image: AssetImage("lib/assets/icons/googleicon.png"),),
                        ),
                      ),
                      SizedBox(width: width*0.05,),
                      Container(
                        height: width*0.065,
                        width: height*0.13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffEAF0F9)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(width*0.02),
                          child: Image(image: AssetImage("lib/assets/icons/appleicon.png"),fit: BoxFit.fill,),
                        ),
                      ),
                      SizedBox(width: height*0.05,),
                      Container(
                        height: width*0.065,
                        width: height*0.13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffEAF0F9)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(width*0.02),
                          child: Image(image: AssetImage("lib/assets/icons/facebookicon.png"),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: width*0.05,),
                  RectangluartextFeild(
                    heights: width*0.07,
                    widths: width*0.90,
                    hinttext: "Your Email",

                    fontsize: width*0.019,
                    keytype: TextInputType.emailAddress,
                  ),
                  SizedBox(height: width*0.02,),
                  RectangluartextFeildWithIcon(

                    heights: width*0.07,
                    widths: width*0.90,
                    obscuringCharacter: "*",

                    texthidden: viewPassword?true:false,
                    onTap: (){

                      setState(() {

                        if(viewPassword==false){
                          viewPassword=true;
                        }
                        else{
                          viewPassword=false;
                        }
                      });
                    },
                    fontsize: width*0.019,

                    hinttext: "Password",
                    imageIconPath: "lib/assets/icons/eyeicon.png",
                    keytype: TextInputType.text,

                  ),
                  SizedBox(height: width*0.04,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetScreen()));
                    },
                    child: VariableText(text: "Forget Password?",
                      underlined: true,
                      fontsize: width*0.015,
                      fontcolor: themeColor1,

                      fontFamily: 'sftr',),
                  ),
                  SizedBox(height: width*0.06,),
                  CustomButton(
                      buttonHeight: width*0.07,
                      buttonWidth:width*0.90,
                      buttonBorderRadius:8,
                      buttonFontSize:width*0.025,
                      buttonColor:themeColor1,
                      buttonTextColor:themeColor2,
                      buttonText: "Login",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      }
                  ),
                  SizedBox(height: width*0.05,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));

                    },
                    child: VariableText(text: "Create account",
                      underlined: true,
                      fontsize: width*0.022,
                      fontcolor: themeColor1,

                      fontFamily: 'sfdm',),
                  ),
                  SizedBox(height: width*0.05,),








                ],
              ),
            ),
          ),
        );
      case Orientation.portrait:
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: themeColor2,
          body: SingleChildScrollView(

            physics: ScrollPhysics(),
              reverse: true,

            child: Padding(
              padding:  EdgeInsets.all(height*0.01),
              child: Column(
                children: [
                  CustomApploginRegistration(ontap: (){
                    Navigator.pop(context);
                  },size: height,text: "Login",),
                  SizedBox(height: height*0.08,),
                  Center(
                    child: Container(
                      height: height*0.08,
                      width: width*0.25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/icons/splashlogo.png'
                              ),
                              fit: BoxFit.fill
                          )
                      ),


                    ),
                  ),
                  SizedBox(height: height*0.03,),
                  Center(
                    child:
                    VariableText(text: "Let’s Sign You In.",
                      fontsize: height*0.025,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),

                  SizedBox(height: height*0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        height: height*0.065,
                        width: width*0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffEAF0F9)
                        ),
                        child:
                        Padding(
                          padding:  EdgeInsets.all(height*0.02),
                          child: Image(
                            image: AssetImage("lib/assets/icons/googleicon.png"),),
                        ),
                      ),
                      SizedBox(width: height*0.05,),
                      Container(
                        height: height*0.065,
                        width: width*0.13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffEAF0F9)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(height*0.02),
                          child: Image(image: AssetImage("lib/assets/icons/appleicon.png"),fit: BoxFit.fill,),
                        ),
                      ),
                      SizedBox(width: height*0.05,),
                      Container(
                        height: height*0.065,
                        width: width*0.13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffEAF0F9)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(height*0.02),
                          child: Image(image: AssetImage("lib/assets/icons/facebookicon.png"),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.05,),
                  RectangluartextFeild(
                    heights: height*0.07,
                    widths: width*0.90,
                    hinttext: "Your Email",

                    fontsize: height*0.019,
                    keytype: TextInputType.emailAddress,
                  ),
                  SizedBox(height: height*0.02,),
                  RectangluartextFeildWithIcon(

                    heights: height*0.07,
                    widths: width*0.90,
                    obscuringCharacter: "*",

                    texthidden: viewPassword?true:false,
                    onTap: (){

                      setState(() {

                        if(viewPassword==false){
                          viewPassword=true;
                        }
                        else{
                          viewPassword=false;
                        }
                      });
                    },
                    fontsize: height*0.019,

                    hinttext: "Password",
                    imageIconPath: "lib/assets/icons/eyeicon.png",
                    keytype: TextInputType.text,

                  ),
                  SizedBox(height: height*0.04,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetScreen()));
                    },
                    child: VariableText(text: "Forget Password?",
                      underlined: true,
                      fontsize: height*0.015,
                      fontcolor: themeColor1,

                      fontFamily: 'sftr',),
                  ),
                  SizedBox(height: height*0.06,),
                  CustomButton(
                      buttonHeight: height*0.07,
                      buttonWidth:width*0.90,
                      buttonBorderRadius:8,
                      buttonFontSize:height*0.025,
                      buttonColor:themeColor1,
                      buttonTextColor:themeColor2,
                      buttonText: "Login",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => route.isCurrent);
                      }
                  ),
                  SizedBox(height: height*0.05,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));

                    },
                    child: VariableText(text: "Create account",
                      underlined: true,
                      fontsize: height*0.022,
                      fontcolor: themeColor1,

                      fontFamily: 'sfdm',),
                  ),








                ],
              ),
            ),
          ),
        );
    }
  }
}
