import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
class TermsConditionsScreen extends StatefulWidget {

  @override
  _TermsConditionsScreenState createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {

  List<Map<String, dynamic>> termandconditionList = [
    {
      "name": "Tincidunt Viverra Vitae ",
      "image": "lib/assets/icons/dot.png"
    },
    {
      "name": "Vestibulum Etiam ",
      "image": "lib/assets/icons/dot.png"
    },
    {
      "name": "Diam Augue ",
      "image": "lib/assets/icons/dot.png"
    },
    {
      "name": "Nisi Dictum ",
      "image": "lib/assets/icons/dot.png"
    },
    {
      "name": "Fermentum Quam Nec ",
      "image": "lib/assets/icons/dot.png"
    },


  ];
  @override
  Widget build(BuildContext context) {
    return TermsConditionsScreen();
  }
  Widget TermsConditionsScreen() {

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
                  VariableText(text: "1-Terms",
                    fontsize: height*0.022,
                    fontcolor: textColor,
                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.015,),
                  VariableText(text: "Vestibulum Commodo Sapien Non Elit Porttitor, Vitae Volutpat Nibh Mollis. Nulla Porta Risus Id Neque Tempor, In Efficitur Justo Imperdiet. Etiam A Ex At Ante Tincidunt Imperdiet.",
                    fontsize: height*0.016,
                    fontcolor: Color(0xff2C3E50),
                    line_spacing: height*0.0018,
                    fontFamily: 'sftr',),



                  SizedBox(height: height*0.04,),
                  VariableText(text: "2-Use License",
                    fontsize: height*0.022,
                    fontcolor: textColor,
                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.015,),
                  VariableText(text: " Nunc Congue Ex Vel Nisl Viverra, Sit Amet Aliquet Lectus Ullamcorper. Praesent Luctus Lacus Non Lorem Elementum, Eu Tristique Sapien Suscipit. Sed Bibendum, Ipsum Nec Viverra Malesuada, Erat Nisi Sodales Purus, Eget Hendrerit Dui Ligula Eu Enim.",
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
                              children: [
                                SizedBox(width: height*0.02,),
                                CircleAvatar(
                                  radius: 5.0,
                                  backgroundImage:
                                  AssetImage(termandconditionList[index]['image']),
                                  backgroundColor: Colors.transparent,
                                ),
                                SizedBox(width: height*0.02,),
                                VariableText(text: termandconditionList[index]['name'],
                                  fontsize: height*0.015,
                                  fontcolor: Color(0xff2C3E50),
                                  weight: FontWeight.normal,
                                  fontFamily: 'sftr',),

                              ],
                            ),
                            SizedBox(height: height*0.01,),
                          ],
                        );

                      }),
                  SizedBox(height: height*0.03,),
                  VariableText(text: " Ut Non Est Nisi. Pellentesque Tristique Pretium Dolor Eu Commodo. Proin Iaculis Nibh Vitae Lectus Mollis Bibendum. Quisque Varius Eget Urna Sit Amet Luctus. Suspendisse Potenti. Curabitur Ac Placerat Est, Sit Amet Sodales Risus. Pellentesque Viverra Dui Auctor, Ullamcorper Turpis Pharetra, Facilisis Quam.",
                    fontsize: height*0.016,
                    fontcolor: Color(0xff2C3E50),
                    line_spacing: height*0.0018,
                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.06,),
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
                  VariableText(text: "1-Terms",
                    fontsize: height*0.022,
                    fontcolor: textColor,
                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.015,),
                  VariableText(text: "Vestibulum Commodo Sapien Non Elit Porttitor, Vitae Volutpat Nibh Mollis. Nulla Porta Risus Id Neque Tempor, In Efficitur Justo Imperdiet. Etiam A Ex At Ante Tincidunt Imperdiet.",
                    fontsize: height*0.016,
                    fontcolor: Color(0xff2C3E50),
                    line_spacing: height*0.0018,
                    fontFamily: 'sftr',),



                  SizedBox(height: height*0.04,),
                  VariableText(text: "2-Use License",
                    fontsize: height*0.022,
                    fontcolor: textColor,
                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.015,),
                  VariableText(text: " Nunc Congue Ex Vel Nisl Viverra, Sit Amet Aliquet Lectus Ullamcorper. Praesent Luctus Lacus Non Lorem Elementum, Eu Tristique Sapien Suscipit. Sed Bibendum, Ipsum Nec Viverra Malesuada, Erat Nisi Sodales Purus, Eget Hendrerit Dui Ligula Eu Enim.",
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
                             children: [
                               SizedBox(width: height*0.02,),
                               CircleAvatar(
                                 radius: 5.0,
                                 backgroundImage:
                                 AssetImage(termandconditionList[index]['image']),
                                 backgroundColor: Colors.transparent,
                               ),
                               SizedBox(width: height*0.02,),
                               VariableText(text: termandconditionList[index]['name'],
                                 fontsize: height*0.015,
                                 fontcolor: Color(0xff2C3E50),
                                 weight: FontWeight.normal,
                                 fontFamily: 'sftr',),

                             ],
                           ),
                           SizedBox(height: height*0.01,),
                         ],
                       );

                 }),
                  SizedBox(height: height*0.03,),
                  VariableText(text: " Ut Non Est Nisi. Pellentesque Tristique Pretium Dolor Eu Commodo. Proin Iaculis Nibh Vitae Lectus Mollis Bibendum. Quisque Varius Eget Urna Sit Amet Luctus. Suspendisse Potenti. Curabitur Ac Placerat Est, Sit Amet Sodales Risus. Pellentesque Viverra Dui Auctor, Ullamcorper Turpis Pharetra, Facilisis Quam.",
                    fontsize: height*0.016,
                    fontcolor: Color(0xff2C3E50),
                    line_spacing: height*0.0018,
                    fontFamily: 'sftr',),
                  SizedBox(height: height*0.06,),
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
