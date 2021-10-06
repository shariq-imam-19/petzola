import 'dart:async';

import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/screens/login_registration/new_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class VerifyForgetPassswordCodeScreen extends StatefulWidget {

  @override
  _VerifyForgetPassswordCodeScreenState createState() => _VerifyForgetPassswordCodeScreenState();
}

class _VerifyForgetPassswordCodeScreenState extends State<VerifyForgetPassswordCodeScreen> {

  bool viewPassword=false;
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {

    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return VerifyForgetPassswordCodeScreen();
  }
  Widget VerifyForgetPassswordCodeScreen() {
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
                  CustomApploginRegistration(
                    ontap: (){
                      Navigator.pop(context);
                    },size: height,text: "Verify Email ",),
                  SizedBox(height: height*0.08,),

                  VariableText(text: "Code Sent To"
                    ,
                    fontsize: height*0.025,
                    fontcolor: Color(0xff2B3E4F),
                    weight: FontWeight.bold,
                    fontFamily: 'sfdb',),
                  Center(
                    child:

                    VariableText(text:   "(Engwalideisa@Gmail.Com)"
                      ,
                      fontsize: height*0.025,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),


                  SizedBox(height: height*0.05,),
                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: themeColor1,
                            fontWeight: FontWeight.bold,
                          ),

                          length: 4,
                          obscureText: false,
                          obscuringCharacter: '*',
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v.length < 5) {
                              return null;
                              //return "I'm from validator";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            disabledColor: Colors.black,
                            errorBorderColor: Colors.black,
                            shape: PinCodeFieldShape.box,
                            selectedFillColor: themeColor2,

                            activeColor:Color(0xff00AEEF) ,
                            inactiveColor: Color(0xffE8E8E8),
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: height*0.08,
                            fieldWidth: width*0.13,
                            inactiveFillColor: themeColor2,
                            activeFillColor:
                            hasError ? Colors.orange : Color(0x4800AEEF),
                          ),
                          cursorColor: Color(0xff00AEEF),
                          animationDuration: Duration(milliseconds: 300),


                          textStyle: TextStyle(fontSize: 20, height: 1.6,color:Color(0xff00AEEF)),
                          backgroundColor: Colors.white,
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,

                          onCompleted: (v) {
                            print("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                  ),




                  SizedBox(height: height*0.02,),
                  VariableText(text: "00:46",

                    fontsize: height*0.015,
                    fontcolor: Color(0xff2C3E50),

                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.02,),
                  InkWell(
                    onTap: (){
                      resendVerificationCode(height,height);
                    },
                    child:
                    VariableText(text: "Resend Code",
                      underlined: true,
                      fontsize: height*0.018,
                      fontcolor: themeColor1,

                      fontFamily: 'sftr',),
                  ),
                  SizedBox(height: height*0.05,),

                  CustomButton(
                      buttonHeight: height*0.07,
                      buttonWidth:height*0.90,
                      buttonBorderRadius:8,
                      buttonFontSize:height*0.025,
                      buttonColor:themeColor1,
                      buttonTextColor:themeColor2,
                      buttonText: "Confirm",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPasswordScreen()));
                      }
                  ),
                  SizedBox(height: height*0.10,),









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
                  CustomApploginRegistration(
                    ontap: (){
                      Navigator.pop(context);
                    },size: height,text: "Verify Email ",),
                  SizedBox(height: height*0.08,),

                  VariableText(text: "Code Sent To"
                    ,
                    fontsize: height*0.025,
                    fontcolor: Color(0xff2B3E4F),
                    weight: FontWeight.bold,
                    fontFamily: 'sfdb',),
                  Center(
                    child:

                    VariableText(text:   "(Engwalideisa@Gmail.Com)"
                      ,
                      fontsize: height*0.025,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),


                  SizedBox(height: height*0.05,),
                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: themeColor1,
                            fontWeight: FontWeight.bold,
                          ),

                          length: 4,
                          obscureText: false,
                          obscuringCharacter: '*',
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v.length < 5) {
                              return null;
                              //return "I'm from validator";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            disabledColor: Colors.black,
                            errorBorderColor: Colors.black,
                            shape: PinCodeFieldShape.box,
                            selectedFillColor: themeColor2,

                            activeColor:Color(0xff00AEEF) ,
                            inactiveColor: Color(0xffE8E8E8),
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: height*0.08,
                            fieldWidth: width*0.13,
                            inactiveFillColor: themeColor2,
                            activeFillColor:
                            hasError ? Colors.orange : Color(0x4800AEEF),
                          ),
                          cursorColor: Color(0xff00AEEF),
                          animationDuration: Duration(milliseconds: 300),


                          textStyle: TextStyle(fontSize: 20, height: 1.6,color:Color(0xff00AEEF)),
                          backgroundColor: Colors.white,
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,

                          onCompleted: (v) {
                            print("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                  ),




                  SizedBox(height: height*0.02,),
                  VariableText(text: "00:46",

                    fontsize: height*0.015,
                    fontcolor: Color(0xff2C3E50),

                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.02,),
                  InkWell(
                    onTap: (){
                      resendVerificationCode(height,width);
                    },
                    child:
                    VariableText(text: "Resend Code",
                      underlined: true,
                      fontsize: height*0.018,
                      fontcolor: themeColor1,

                      fontFamily: 'sftr',),
                  ),
                  SizedBox(height: height*0.05,),

                  CustomButton(
                      buttonHeight: height*0.07,
                      buttonWidth:width*0.90,
                      buttonBorderRadius:8,
                      buttonFontSize:height*0.025,
                      buttonColor:themeColor1,
                      buttonTextColor:themeColor2,
                      buttonText: "Confirm",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPasswordScreen()));
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
  void resendVerificationCode(double height,double width){
    showModalBottomSheet(
        isScrollControlled: true,
        //transitionAnimationController: controller,
        backgroundColor: Colors.transparent,
        context: context, builder: (context) {

      return DraggableScrollableSheet(
          initialChildSize: 0.65, //set this as you want
          maxChildSize:0.65, //set this as you want
          minChildSize:0.65, //set this as you want
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(height*0.05) ,
                      topRight: Radius.circular(height*0.05)
                  ),
                ),
                child: SingleChildScrollView(

                  child: Column(
                    children: [
                      SizedBox(height: height*0.03,),
                      VariableText(text: "Resend Code",
                        fontsize: height*0.028,
                        fontcolor: Color(0xff2B3E4F),

                        fontFamily: 'sfdr',),
                      SizedBox(height: height*0.07,),
                      Center(
                        child: Container(
                          child: CircleAvatar(
                            radius: height*0.08,
                            backgroundColor: Color(0xffF8F7F7),
                            backgroundImage: AssetImage('lib/assets/icons/resendcodeicon.png'),
                          ),
                        ),
                      ),

                      SizedBox(height: height*0.04,),
                      VariableText(text: "Resend the code to the number?",

                        fontsize: height*0.018,
                        fontcolor: Color(0xff3C3C43),

                        fontFamily: 'sftr',),
          SizedBox(height: height*0.07,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:  height*0.03),
                        child: Row(
                          children: [
                            Expanded(
                              child: RectangluartextFeildWithIcon(
                                heights: height*0.07,

                                hinttext: "Your Email",

                                fontsize: height*0.019,
                                imageIconPath: "lib/assets/icons/changeorientation.png",
                                keytype: TextInputType.emailAddress,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.05,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                  buttonHeight: height*0.07,
                                  buttonBorderRadius:8,
                                  buttonFontSize:height*0.025,
                                  buttonColor:themeColor1,
                                  buttonTextColor:themeColor2,
                                  buttonText: "Confirm",
                                  buttonFontFamily:'sfdm',
                                  buttonOnTap:(){
                                    Navigator.of(context).pop();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPasswordScreen()));
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.05,),


                    ],
                  ),
                ),
              ),
            );
            //whatever you're returning, does not have to be a Container
          }

      );
    });
  }

}

class TextEditorForPhoneVerify extends StatelessWidget {
  final TextEditingController code;

  TextEditorForPhoneVerify(this.code);

  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: this.code,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            hintText: "*",
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)
        )
    );
  }
}
