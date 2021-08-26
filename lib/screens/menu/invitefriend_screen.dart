import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
class InviteFriendScreen extends StatefulWidget {

  @override
  _InviteFriendScreenState createState() => _InviteFriendScreenState();
}

class _InviteFriendScreenState extends State<InviteFriendScreen> {
  @override
  Widget build(BuildContext context) {
    return InviteFriendScreen();
  }
  Widget InviteFriendScreen() {

    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Invite Friend",),
          ),
          backgroundColor: themeColor2,
          body: Padding(
            padding:  EdgeInsets.all(height*0.01),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height: height*0.05,),
                  Center(
                    child: Container(
                      child: CircleAvatar(
                        radius: height*0.12,
                        backgroundColor: Color(0xffEAF0F9),
                        backgroundImage: AssetImage('lib/assets/icons/invitefriends.png'),
                      ),


                    ),
                  ),
                  SizedBox(height: height*0.05,),
                  VariableText(text: "Invite Your Friends",
                    fontsize: height*0.028,
                    fontcolor: Color(0xff2B3E4F),

                    fontFamily: 'sftr',),
                  VariableText(text: "Reward Youself",
                    fontsize: height*0.028,
                    fontcolor: Color(0xff2B3E4F),

                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.02,),
                  VariableText(text: "For Every Friends Join. You",
                    fontsize: height*0.016,
                    fontcolor: Color(0x6c3C3C43),
                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.0055,),
                  VariableText(text: "Both Get 1200 Point",
                    fontsize: height*0.016,
                    fontcolor: Color(0x6c3C3C43),
                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.06,),
                  RectangluartextFeild(
                    heights: height*0.07,
                    widths: height*0.95,
                    hinttext: "Email",

                    fontsize: height*0.019,
                    keytype: TextInputType.emailAddress,
                  ),
                  SizedBox(height: height*0.04,),
                  VariableText(text: "Usd78zx",
                    fontsize: height*0.018,
                    fontcolor: Color(0xff2B3E4F),
                    fontFamily: 'sftsb',),
                  SizedBox(height: height*0.0055,),
                  VariableText(text: "Your invite code",
                    fontsize: height*0.016,
                    fontcolor: Color(0x6c3C3C43),
                    fontFamily: 'sftr',),






                  SizedBox(height: width*0.10,),
                  Padding(
                    padding:  EdgeInsets.only(bottom: height*0.03),
                    child:
                    CustomButton(
                        buttonHeight: height*0.07,
                        buttonWidth:height*0.95,
                        buttonBorderRadius:8,
                        buttonFontSize:height*0.025,
                        buttonColor:themeColor1,
                        buttonTextColor:themeColor2,
                        buttonText: "Send invite",
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
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Invite Friend",),
          ),
          backgroundColor: themeColor2,
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal:height*0.025),
            child: Column(

              children: [
                SizedBox(height: height*0.05,),
                Center(
                  child: Container(
                    child: CircleAvatar(
                      radius: height*0.12,
                      backgroundColor: Color(0xffEAF0F9),
                      backgroundImage: AssetImage('lib/assets/icons/invitefriends.png'),
                    ),
                  ),
                ),
                SizedBox(height: height*0.05,),
                VariableText(text: "Invite Your Friends",
                  fontsize: height*0.028,
                  fontcolor: Color(0xff2B3E4F),

                  fontFamily: 'sftr',),
                VariableText(text: "Reward Youself",
                  fontsize: height*0.028,
                  fontcolor: Color(0xff2B3E4F),

                  fontFamily: 'sftr',),
                SizedBox(height: height*0.02,),
                VariableText(text: "For Every Friends Join. You",
                  fontsize: height*0.016,
                  fontcolor: Color(0x6c3C3C43),
                 fontFamily: 'sftr',),
                SizedBox(height: height*0.0055,),
                VariableText(text: "Both Get 1200 Point",
                  fontsize: height*0.016,
                  fontcolor: Color(0x6c3C3C43),
                  fontFamily: 'sftr',),
                SizedBox(height: height*0.06,),
                RectangluartextFeild(
                  heights: height*0.07,
                  widths: width*0.90,
                  hinttext: "Email",

                  fontsize: height*0.019,
                  keytype: TextInputType.emailAddress,
                ),
                SizedBox(height: height*0.04,),
                VariableText(text: "Usd78zx",
                  fontsize: height*0.018,
                  fontcolor: Color(0xff2B3E4F),
                  fontFamily: 'sftsb',),
                SizedBox(height: height*0.0055,),
                VariableText(text: "Your invite code",
                  fontsize: height*0.016,
                  fontcolor: Color(0x6c3C3C43),
                  fontFamily: 'sftr',),
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
                      buttonText: "Send invite",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                        Navigator.pop(context);
                      }
                  ),
                )





              ],
            ),
          ),
        );
    }
  }
}
