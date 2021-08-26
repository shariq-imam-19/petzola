import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/screens/login_registration/forget_password_screen.dart';
import 'package:petzola/screens/login_registration/login_screen.dart';
import 'package:petzola/screens/login_registration/sign_up_screen.dart';
class NewPasswordScreen extends StatefulWidget {

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {

  bool viewPassword=false;
  @override
  Widget build(BuildContext context) {
    return NewPasswordScreen();
  }
  Widget NewPasswordScreen() {
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: themeColor2,
          body: Padding(
            padding:  EdgeInsets.all(height*0.01),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomApploginRegistration(ontap: (){
                    Navigator.pop(context);
                  },
                    size: height,text: "New Password",),
                  SizedBox(height: height*0.08,),
                  Center(
                    child: Container(
                      height: height*0.08,
                      width: width*0.30,
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
                  VariableText(text: "Be Sure To Set A Strong",
                    fontsize: height*0.025,
                    fontcolor: Color(0xff2B3E4F),
                    weight: FontWeight.bold,
                    fontFamily: 'sfdb',),
                  VariableText(text: "Password",
                    fontsize: height*0.025,
                    fontcolor: Color(0xff2B3E4F),
                    weight: FontWeight.bold,
                    fontFamily: 'sfdb',),

                  SizedBox(height: height*0.05,),

                  SizedBox(height: height*0.05,),
                  RectangluartextFeildWithIcon(

                    heights: height*0.07,
                    widths: height*0.90,
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

                    hinttext: "New Password",
                    imageIconPath: "lib/assets/icons/eyeicon.png",
                    keytype: TextInputType.text,

                  ),
                  SizedBox(height: height*0.03,),
                  RectangluartextFeildWithIcon(

                    heights: height*0.07,
                    widths: height*0.90,
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

                    hinttext: "Confirm A New Password",
                    imageIconPath: "lib/assets/icons/eyeicon.png",
                    keytype: TextInputType.text,

                  ),
                  SizedBox(height: height*0.08,),




                  Padding(
                    padding:  EdgeInsets.only(bottom: height*0.07),
                    child: CustomButton(
                        buttonHeight: height*0.07,
                        buttonWidth:height*0.90,
                        buttonBorderRadius:8,
                        buttonFontSize:height*0.025,
                        buttonColor:themeColor1,
                        buttonTextColor:themeColor2,
                        buttonText: "Save New Password",
                        buttonFontFamily:'sfdm',
                        buttonOnTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        }
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
          resizeToAvoidBottomInset: false,
          backgroundColor: themeColor2,
          body: LayoutBuilder(builder: (context,constraints){
            return  Padding(
              padding:  EdgeInsets.all(height*0.01),
              child: SingleChildScrollView(
                reverse: true,
                physics: ScrollPhysics(),
                child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),

                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          CustomApploginRegistration(ontap: (){
                            Navigator.pop(context);
                          },
                            size: height,text: "New Password",),
                          SizedBox(height: height*0.08,),
                          Center(
                            child: Container(
                              height: height*0.08,
                              width: width*0.30,
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
                          VariableText(text: "Be Sure To Set A Strong",
                            fontsize: height*0.025,
                            fontcolor: Color(0xff2B3E4F),
                            weight: FontWeight.bold,
                            fontFamily: 'sfdb',),
                          VariableText(text: "Password",
                            fontsize: height*0.025,
                            fontcolor: Color(0xff2B3E4F),
                            weight: FontWeight.bold,
                            fontFamily: 'sfdb',),

                          SizedBox(height: height*0.05,),

                          SizedBox(height: height*0.05,),
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

                            hinttext: "New Password",
                            imageIconPath: "lib/assets/icons/eyeicon.png",
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

                            hinttext: "Confirm A New Password",
                            imageIconPath: "lib/assets/icons/eyeicon.png",
                            keytype: TextInputType.text,

                          ),
                          Spacer(),



                          Padding(
                            padding:  EdgeInsets.only(bottom: height*0.07),
                            child: CustomButton(
                                buttonHeight: height*0.07,
                                buttonWidth:width*0.90,
                                buttonBorderRadius:8,
                                buttonFontSize:height*0.025,
                                buttonColor:themeColor1,
                                buttonTextColor:themeColor2,
                                buttonText: "Save New Password",
                                buttonFontFamily:'sfdm',
                                buttonOnTap:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                                }
                            ),
                          ),









                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          })
        );
    }
  }
}
