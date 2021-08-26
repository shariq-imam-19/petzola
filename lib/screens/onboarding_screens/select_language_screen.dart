import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/screens/login_registration/login_screen.dart';
import 'package:petzola/screens/onboarding_screens/onboarding_screen1.dart';
class SelectLanguageScreen extends StatefulWidget {

  @override
  _SelectLanguageScreenState createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  int selectlanguage=0;
  List<Map<String, dynamic>> countryList = [
    {
      "name": "EGPYT",
      "image": "lib/assets/icons/egypt.png"
    },
    {
      "name": "UAE",
      "image": "lib/assets/icons/united-arab-emirates.png"
    },

  ];
  _onselected(int i){
    setState(() {
      selectlanguage=i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return selectLanguage();
  }
  Widget selectLanguage() {
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
                  SizedBox(height: width*0.09,),
                  Center(
                    child:
                    VariableText(text: "Select Country",
                      fontsize: width*0.030,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),
                  SizedBox(height: width*0.05,),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: countryList.length,
                      itemBuilder: (BuildContext context,int index){
                        return Column(
                          children: [
                            InkWell(
                              onTap: (){
                                _onselected(index);
                              },
                              child:
                              ListTile(
                                leading:
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage:
                                  AssetImage(countryList[index]['image']),
                                  backgroundColor: Colors.transparent,
                                ),
                                title:  VariableText(text: countryList[index]['name'],
                                  fontsize: width*0.018,
                                  fontcolor: Color(0xff2B3E4F),
                                  weight: FontWeight.normal,
                                  fontFamily: 'sftr',),
                                trailing:

                                selectlanguage==index?Padding(
                                  padding:  EdgeInsets.all(width*0.005),
                                  child: ImageIcon(
                                    AssetImage("lib/assets/icons/tickicon.png"),
                                    color: Color(0xffF47920),
                                  ),
                                ):Container(child: Text(""),),
                              ),
                            ),
                            SizedBox(height: width*0.02,),
                          ],
                        );

                      }),

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
                        buttonText: "Select",
                        buttonFontFamily:'sfdm',
                        buttonOnTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
          backgroundColor: themeColor2,
          body: Padding(
            padding:  EdgeInsets.all(height*0.01),
            child: Column(
              children: [
                SizedBox(height: height*0.15,),
                Center(
                  child:
                  VariableText(text: "Select Country",
                  fontsize: height*0.030,
                  fontcolor: Color(0xff2B3E4F),
                  weight: FontWeight.bold,
                    fontFamily: 'sfdb',),
                ),
                SizedBox(height: height*0.05,),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: countryList.length,
                    itemBuilder: (BuildContext context,int index){
                      return Column(
                        children: [
                          InkWell(
                            onTap: (){
                              _onselected(index);
                            },
                            child: ListTile(
                              leading:
                              CircleAvatar(
                                radius: 20.0,
                                backgroundImage:
                                AssetImage(countryList[index]['image']),
                                backgroundColor: Colors.transparent,
                              ),
                              title:
                              VariableText(text: countryList[index]['name'],
                                fontsize: height*0.018,
                                fontcolor: Color(0xff2B3E4F),
                                weight: FontWeight.normal,
                                fontFamily: 'sftr',),
                              trailing:

                              selectlanguage==index?Padding(
                                padding:  EdgeInsets.all(height*0.005),
                                child: ImageIcon(
                                  AssetImage("lib/assets/icons/tickicon.png"),
                                  color: Color(0xffF47920),
                                ),
                              ):Container(child: Text(""),),
                            ),
                          ),
                          SizedBox(height: height*0.02,),
                        ],
                      );

                }),



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
                      buttonText: "Select",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OnboardingScreen1()));
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
