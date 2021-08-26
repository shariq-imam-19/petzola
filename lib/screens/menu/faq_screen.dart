import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
class FAQScreen extends StatefulWidget {

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  bool minimizeicon=false;
  List<Map<String, dynamic>> termandconditionList = [
    {
      "name": "Tincidunt Viverra Vitae ",
      "image": "lib/assets/icons/plus.png"
    },
    {
      "name": "Vestibulum Etiam ",
      "image": "lib/assets/icons/plus.png"
    },
    {
      "name": "Diam Augue ",
      "image": "lib/assets/icons/plus.png"
    },
    {
      "name": "Nisi Dictum ",
      "image": "lib/assets/icons/plus.png"
    },
    {
      "name": "Fermentum Quam Nec ",
      "image": "lib/assets/icons/plus.png"
    },


  ];
  @override
  Widget build(BuildContext context) {
    return FAQScreen();
  }
  Widget FAQScreen() {

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
            child: CustomMenuAppBar(size: height,title: "Terms & Conditions",),
          ),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:height*0.025),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.05,),
                  RectangluartextFeildWithStartIcon(
                    heights: height*0.07,
                    widths: height*0.95,

                    fontsize: height*0.019,
                    hinttext: "Search",
                    imageIconPath: "lib/assets/icons/searchIcon.png",
                    keytype: TextInputType.text,
                  ),
                  SizedBox(height: height*0.05,),

                  VariableText(text: "Question",
                    fontsize: height*0.027,
                    fontcolor: textColor,
                    fontFamily: 'sftr',),




                  SizedBox(height: height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VariableText(text: "Tincidunt Viverra Vitae ",
                        fontsize: height*0.017,
                        fontcolor: Color(0xff2C3E50),
                        weight: FontWeight.normal,),
                      Padding(
                        padding: EdgeInsets.only(bottom: height*0.01,),
                        child:
                        InkWell(
                            onTap: (){
                              setState(() {
                                if(minimizeicon==false){
                                  minimizeicon=true;
                                }
                                else{
                                  minimizeicon=false;
                                }
                              });
                            },
                            child:
                            minimizeicon?Image.asset("lib/assets/icons/plus.png",scale: 4.2,):Image.asset("lib/assets/icons/minus.png",scale: 4.5,)),

                      )
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  minimizeicon?Container():VariableText(text: " Ut Non Est Nisi. Pellentesque Tristique Pretium Dolor Eu Commodo. Proin Iaculis Nibh Vitae Lectus Mollis Bibendum. Quisque Varius Eget Urna Sit Amet Luctus. Suspendisse Potenti. Curabitur Ac Placerat Est, Sit Amet Sodales Risus. Pellentesque Viverra Dui Auctor, Ullamcorper Turpis Pharetra, Facilisis Quam.",
                    fontsize: height*0.016,
                    fontcolor: Color(0xff2C3E50),
                    line_spacing: height*0.0018,
                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.025,),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: termandconditionList.length,
                      itemBuilder: (BuildContext context,int index){
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                VariableText(text: termandconditionList[index]['name'],
                                  fontsize: height*0.017,
                                  fontcolor: Color(0xff2C3E50),
                                  weight: FontWeight.normal,
                                  fontFamily: 'sftr',),
                                Image.asset(termandconditionList[index]['image'],scale: 4.5,),




                              ],
                            ),
                            SizedBox(height: height*0.03,),


                          ],
                        );

                      }),
                  SizedBox(height: height*0.045,),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VariableText(text: "Last Update",
                        fontsize: height*0.016,
                        fontcolor: Color(0xff646060),
                        line_spacing: height*0.0018,
                        fontFamily: 'sftr',),
                      SizedBox(width: height*0.015,),
                      VariableText(text: "21/08/1959"  ,fontsize: height*0.016,
                        fontcolor: Color(0xff646060),
                        line_spacing: height*0.0018,
                        fontFamily: 'sftr',),

                    ],
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
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Terms & Conditions",),
          ),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:height*0.025),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.05,),
                  RectangluartextFeildWithStartIcon(
                  heights: height*0.07,
                  widths: width*0.90,

                  fontsize: height*0.019,
                  hinttext: "Search",
                  imageIconPath: "lib/assets/icons/searchIcon.png",
                  keytype: TextInputType.text,
                ),
                  SizedBox(height: height*0.05,),

                  VariableText(text: "Question",
                    fontsize: height*0.027,
                    fontcolor: textColor,
                    fontFamily: 'sftr',),




                  SizedBox(height: height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VariableText(text: "Tincidunt Viverra Vitae ",
                        fontsize: height*0.017,
                        fontcolor: Color(0xff2C3E50),
                        weight: FontWeight.normal,),
                      Padding(
                        padding: EdgeInsets.only(right: 0,bottom: height*0.01,),
                        child:
                        InkWell(
                            onTap: (){
                              setState(() {
                                if(minimizeicon==false){
                                  minimizeicon=true;
                                }
                                else{
                                  minimizeicon=false;
                                }
                              });
                            },
                            child:
                            minimizeicon?Image.asset(

                              "lib/assets/icons/plus.png",scale: 4.2,):Image.asset("lib/assets/icons/minus.png",scale: 4.5,)),
                      )
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  minimizeicon?Container():VariableText(text: " Ut Non Est Nisi. Pellentesque Tristique Pretium Dolor Eu Commodo. Proin Iaculis Nibh Vitae Lectus Mollis Bibendum. Quisque Varius Eget Urna Sit Amet Luctus. Suspendisse Potenti. Curabitur Ac Placerat Est, Sit Amet Sodales Risus. Pellentesque Viverra Dui Auctor, Ullamcorper Turpis Pharetra, Facilisis Quam.",
                    fontsize: height*0.016,
                    fontcolor: Color(0xff2C3E50),
                    line_spacing: height*0.0018,
                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.025,),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: termandconditionList.length,
                      itemBuilder: (BuildContext context,int index){
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                VariableText(text: termandconditionList[index]['name'],
                                  fontsize: height*0.017,
                                  fontcolor: Color(0xff2C3E50),
                                  weight: FontWeight.normal,
                                  fontFamily: 'sftr',),
                                Image.asset(termandconditionList[index]['image'],scale: 4.5,),




                              ],
                            ),
                            SizedBox(height: height*0.03,),


                          ],
                        );

                      }),
                  SizedBox(height: height*0.045,),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VariableText(text: "Last Update",
                        fontsize: height*0.016,
                        fontcolor: Color(0xff646060),
                        line_spacing: height*0.0018,
                        fontFamily: 'sftr',),
                      SizedBox(width: height*0.015,),
                      VariableText(text: "21/08/1959"  ,fontsize: height*0.016,
                        fontcolor: Color(0xff646060),
                        line_spacing: height*0.0018,
                        fontFamily: 'sftr',),

                    ],
                  )



                ],
              ),
            ),
          ),
        );
    }
  }
}
