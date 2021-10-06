import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/global_variables.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/Language.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/screens/home/home_page.dart';
import 'package:petzola/screens/splash_screen.dart';
class LanguageScreen extends StatefulWidget {

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectlanguage=0;
  List<Map<String, dynamic>> countryList = [
    {
      "name": "عربي",
      "image": "lib/assets/icons/egypt.png"
    },
    {
      "name": "English",
      "image": "lib/assets/icons/united-arab-emirates.png"
    },

  ];
  _onselected(int i){
    setState(() {
      selectlanguage=i;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(currLang == 'ar'){
      selectlanguage = 0;
    }else{
      selectlanguage = 1;
    }
  }
  @override
  Widget build(BuildContext context) {
    return LanguageScreen();
  }
  Widget LanguageScreen() {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: width,title: getTranslated(context, "Language")),
          ),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(

            child: Padding(
              padding:  EdgeInsets.all(height*0.01),
              child: Column(
                children: [

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
                        buttonText: getTranslated(context, "Save Language"),
                        buttonFontFamily:'sfdm',
                        buttonOnTap:(){
                          if(selectlanguage == 0){
                            Language l1 = new Language(2, 'arabic', 'ar');
                            _changeLanguage(l1);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SplashScreen()), (route) => route.isCurrent);
                          }else{
                            Language l1 = new Language(2, 'English', 'en');
                            _changeLanguage(l1);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SplashScreen()), (route) => route.isCurrent);
                          }
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Language",),
          ),
          backgroundColor: themeColor2,
          body: Padding(
            padding:  EdgeInsets.all(height*0.01),
            child: Column(
              children: [

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
                              title:  VariableText(text: countryList[index]['name'],
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
                      buttonText: getTranslated(context, "Save Language"),
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){

                        if(selectlanguage == 0){
                          Language l1 = new Language(2, 'arabic', 'ar');
                          _changeLanguage(l1);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SplashScreen()), (route) => route.isCurrent);
                        }else{
                          Language l1 = new Language(2, 'English', 'en');
                          _changeLanguage(l1);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SplashScreen()), (route) => route.isCurrent);
                        }

                        //print(countryList[selectlanguage]['name']);

                      }
                  ),
                )





              ],
            ),
          ),
        );
    }
  }

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    HomePage.setLocale(context, _locale);
  }

}
