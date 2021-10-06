import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
class FavouriteScreen extends StatefulWidget {

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<String> yourVets = ['Vet', 'Services'];
  int _selectedIndex = 0;
  bool emptyFavourite=true;

  _onSelected(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return FavouriteScreen();
  }
Widget FavouriteScreen() {

  switch (MediaQuery
      .of(context)
      .orientation) {
    case Orientation.landscape:
      double width=MediaQuery.of(context).size.height;
      double height=MediaQuery.of(context).size.width;
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomMenuAppBar(size: height,title: "Favourite",),
        ),

        backgroundColor: themeColor2,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:height*0.025),
            child: Column(
              children: [
                SizedBox(height: height*0.05,),
                Container(
                  child: Row(
                    children: List.generate(yourVets.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          _onSelected(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFF8F7F7),
                              borderRadius: index == 0 ? BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)):
                              BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
                          ),
                          child: Container(
                            height: height*0.07,
                            width: height*0.35,
                            decoration: BoxDecoration(
                                color: _selectedIndex == index
                                    ? Color(0xFF00AEEF)
                                    : Color(0xFFF8F7F7),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: VariableText(
                                  text: yourVets[index],
                                  fontsize: 15,
                                  fontcolor: _selectedIndex == index
                                      ? Colors.white
                                      : Color(0xFF2C3E50)),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
               /* Stack(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: height*0.13),
                      child: Row(
                        children: [
                          Container(
                            height: height*0.07,
                            width: height*0.40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(height*0.02),
                                color: Color(0xffF8F7F7)
                            ),

                            child: Center(
                              child: VariableText(text: "Services",
                                fontsize: height*0.022,
                                fontcolor: Color(0xff2C3E50),

                                fontFamily: 'sftr',),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: height*0.07,
                      width: height*0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(height*0.02),
                          color: themeColor1
                      ),
                      child: Center(
                        child: VariableText(text: "Vet",
                          fontsize: height*0.022,
                          fontcolor: themeColor2,

                          fontFamily: 'sftr',),
                      ),
                    ),

                  ],
                ),*/
                SizedBox(height: height*0.03,),
                FavouriteContainer(
                    cWidth:height,
                    cHeight: height),
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
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Favourite",),
        ),

        backgroundColor: themeColor2,
        body: emptyFavourite?
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/assets/icons/favouriteoutline.png',scale: 5.5,),
                SizedBox(height: height*0.025,),
                Center(
                  child: VariableText(text: getTranslated(context, "There Are No Preferences Yet"),
                    fontsize: height*0.016,
                    fontcolor: Color(0xfc3C3C43),

                    fontFamily: 'sftr',),
                ),
              ],

            )
            :
        SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:height*0.025),
            child: Column(
              children: [
                SizedBox(height: height*0.05,),
                Container(
                  child: Row(
                    children: List.generate(yourVets.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          _onSelected(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFF8F7F7),
                              borderRadius: index == 0 ? BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)):
                              BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
                          ),
                          child: Container(
                            height: height*0.07,
                            width: width*0.35,
                            decoration: BoxDecoration(
                                color: _selectedIndex == index
                                    ? Color(0xFF00AEEF)
                                    : Color(0xFFF8F7F7),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: VariableText(
                                  text: yourVets[index],
                                  fontsize: 15,
                                  fontcolor: _selectedIndex == index
                                      ? Colors.white
                                      : Color(0xFF2C3E50)),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                /*Stack(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: height*0.12),
                      child: Row(
                        children: [


                          Container(
                            height: height*0.07,
                            width: width*0.40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(height*0.02),
                                color: Color(0xffF8F7F7)
                            ),

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                VariableText(text: "Services",
                                  fontsize: height*0.022,
                                  fontcolor: Color(0xff2C3E50),

                                  fontFamily: 'sftr',),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: height*0.07,
                      width: width*0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(height*0.02),
                          color: themeColor1
                      ),
                      child: Center(
                        child: VariableText(text: "Vet",
                          fontsize: height*0.022,
                          fontcolor: themeColor2,

                          fontFamily: 'sftr',),
                      ),
                    ),

                  ],
                ),*/
                SizedBox(height: height*0.03,),
                FavouriteContainer(
                    cWidth:width,
                    cHeight: height),


              ],
            ),
          ),
        ),
      );
  }
}

}


