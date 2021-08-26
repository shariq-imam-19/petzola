import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:petzola/screens/onboarding_screens/onboarding_screen2.dart';
class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool viewPassword=false;

  @override
  Widget build(BuildContext context) {
    return SignUpScreen();
  }
  Widget SignUpScreen() {
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
              padding:  EdgeInsets.all(height*0.01),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: width*0.05  , height: 0,),
                      VariableText(text:"Signup" ,fontFamily: "sftsb",fontsize: width*0.022,),

                      ChangeOrientationIcon(ontap: (){
                        Navigator.of(context).pop();

                      },size: width,),

                    ],
                  ),

                  SizedBox(height: width*0.08,),
                  Center(
                    child:
                    VariableText(text: "Welcome to Petzola",
                      fontsize: width*0.030,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),
                  SizedBox(height: width*0.05,),
                  Center(
                    child: Container(
                      height: width*0.14,
                      width: height*0.50,
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
                  SizedBox(height: width*0.05,),
                  RectangluartextFeild(
                    heights: width*0.07,
                    widths: width*0.90,
                    fontsize: width*0.019,

                    hinttext: "Your Name",
                    //cont: password,
                    textlength: 11,


                    // obscureText: true,

                    keytype: TextInputType.text,
                    //  onChanged: enableBtn(mobileno.text),

                  ),
                  SizedBox(height: width*0.02,),
                  RectangluartextFeild(
                    heights: width*0.07,
                    widths: width*0.90,
                    hinttext: "Your Email",

                    fontsize: width*0.019,
                    keytype: TextInputType.text,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppCheckbox(size: width*0.03,),
                      SizedBox(width: height*0.03,),
                      VariableText(text: "I Agree",
                        fontsize: width*0.015,
                        fontcolor: Color(0xff2C3E50),

                        fontFamily: 'sftr',),

                      SizedBox(width: height*0.01,),
                      VariableText(text: "Term & Cnndition",
                        underlined: true,
                        fontsize: width*0.015,
                        fontcolor: themeColor1,

                        fontFamily: 'sftr',),

                    ],),
                  SizedBox(height: width*0.06,),
                  CustomLoadingAnimation(height: width,width: height,animationPercent: 0.25,onTap: (){
                    print("sjsjsjsjsj");
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen2()));
                    },),
                  SizedBox(height: width*0.06,),









                ],
              ),
            ),
          ),
        );
      case Orientation.portrait:
        return Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),

            child: Padding(
              padding:  EdgeInsets.all(height*0.01),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: width*0.05  , height: 0,),
                      VariableText(text:"Signup" ,fontFamily: "sftsb",fontsize: height*0.022,),

                      ChangeOrientationIcon(ontap: (){
                        Navigator.of(context).pop();
                      },size: height,),

                    ],
                  ),
                   SizedBox(height: height*0.08,),
                  Center(
                    child:
                    VariableText(text: "Welcome to Petzola",
                      fontsize: height*0.030,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),
                  SizedBox(height: height*0.05,),
                  Center(
                    child: Container(
                      height: height*0.14,
                      width: width*0.50,
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
                  SizedBox(height: height*0.05,),
                  RectangluartextFeild(
                    heights: height*0.07,
                    widths: width*0.90,

                    hinttext: "Your Name",
                    //cont: password,
                    textlength: 11,

                    fontsize: height*0.019,
                    obscuringCharacter: "*",

                    // obscureText: true,

                    keytype: TextInputType.text,
                    //  onChanged: enableBtn(mobileno.text),

                  ),
                  SizedBox(height: height*0.02,),
                  RectangluartextFeild(
                    heights: height*0.07,
                    widths: width*0.90,
                    hinttext: "Your Email",

                    fontsize: height*0.019,
                    keytype: TextInputType.text,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppCheckbox(size:  height*0.03,),
                      SizedBox(width: width*0.03,),
                      VariableText(text: "I Agree",
                        fontsize: height*0.015,
                        fontcolor: Color(0xff2C3E50),

                        fontFamily: 'sftr',),

                      SizedBox(width: width*0.01,),
                      VariableText(text: "Term & Cnndition",
                        underlined: true,
                        fontsize: height*0.015,
                        fontcolor: themeColor1,

                        fontFamily: 'sftr',),

                    ],),
                  SizedBox(height: height*0.06,),
                  CustomLoadingAnimation(height: height,width: width,animationPercent: 0.25,onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen2()));


                  },)
                  /*InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen2()));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/assets/icons/nextbutton.png"),
                      backgroundColor: Colors.transparent,
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
