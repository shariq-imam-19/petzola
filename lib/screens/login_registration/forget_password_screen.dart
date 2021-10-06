import 'package:flutter/material.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/screens/login_registration/verify_forget_password_code_screen.dart';
class ForgetScreen extends StatefulWidget {

  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {

  TextEditingController _emailController = new TextEditingController();
  bool viewPassword=false;
  @override
  Widget build(BuildContext context) {
    return ForgetScreen();
  }
  Widget ForgetScreen() {
    bool _checkbox = false;

    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(

            child: Padding(
              padding:  EdgeInsets.all(height*0.01),
              child: Column(
                children: [
                  CustomApploginRegistration(ontap: (){
                    Navigator.pop(context);
                  },size: height,text: "Forget Password",),
                  SizedBox(height: height*0.08,),

                  VariableText(text: "Do Not Worry You Will Restart"
                    ,
                    fontsize: height*0.025,
                    fontcolor: Color(0xff2B3E4F),
                    weight: FontWeight.bold,
                    fontFamily: 'sfdb',),
                  Center(
                    child:

                    VariableText(text:   "Your Account Quickly"
                      ,
                      fontsize: height*0.025,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),


                  SizedBox(height: height*0.12,),


                  RectangluartextFeildWithIcon(
                    heights: height*0.07,
                    widths: height*0.90,
                    hinttext: "Your Email",
                    cont: _emailController,
                    fontsize: height*0.019,
                    imageIconPath: "lib/assets/icons/cross_clear.png",
                    keytype: TextInputType.emailAddress,
                    onTap: (){
                      _emailController.clear();
                    },
                  ),
                  SizedBox(height: height*0.05,),

                  CustomButton(
                      buttonHeight: height*0.07,
                      buttonWidth:height*0.90,
                      buttonBorderRadius:8,
                      buttonFontSize:height*0.025,
                      buttonColor:themeColor1,
                      buttonTextColor:themeColor2,
                      buttonText: "Send",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyForgetPassswordCodeScreen()));
                      }
                  ),
                  SizedBox(height: height*0.05,),









                ],
              ),
            ),
          ),
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(

            child: Padding(
              padding:  EdgeInsets.all(height*0.01),
              child: Column(
                children: [
                  CustomApploginRegistration(ontap: (){
                    Navigator.pop(context);
                  },size: height,text: "Forget Password",),
                  SizedBox(height: height*0.08,),

                  VariableText(text: "Do Not Worry You Will Restart"
                   ,
                    fontsize: height*0.025,
                    fontcolor: Color(0xff2B3E4F),
                    weight: FontWeight.bold,
                    fontFamily: 'sfdb',),
                  Center(
                    child:

                    VariableText(text:   "Your Account Quickly"
                      ,
                      fontsize: height*0.025,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),


                  SizedBox(height: height*0.17,),


                  RectangluartextFeildWithIcon(
                    heights: height*0.07,
                    widths: width*0.90,
                    hinttext: "Your Email",
                    fontsize: height*0.019,
                    cont: _emailController,
                    imageIconPath: "lib/assets/icons/cross_clear.png",
                    keytype: TextInputType.emailAddress,
                    onTap: (){
                      _emailController.clear();
                    },
                  ),
                  SizedBox(height: height*0.05,),

                  CustomButton(
                      buttonHeight: height*0.07,
                      buttonWidth:width*0.90,
                      buttonBorderRadius:8,
                      buttonFontSize:height*0.025,
                      buttonColor:themeColor1,
                      buttonTextColor:themeColor2,
                      buttonText: "Send",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyForgetPassswordCodeScreen()));
                      }
                  ),
                  SizedBox(height: height*0.05,),









                ],
              ),
            ),
          ),
        );
    }
  }
}
