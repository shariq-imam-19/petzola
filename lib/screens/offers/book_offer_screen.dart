import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/global_variables.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'book_offer_bio_screen.dart';
import 'book_offer_reviews.dart';
import 'book_offer_schedule_screen.dart';
import 'get_offer_payment_screen.dart';
import 'dart:math' as math;

class
BookOfferScreen extends StatefulWidget {


  @override
  _BookOfferScreenState createState() => _BookOfferScreenState();
}

class _BookOfferScreenState extends State<BookOfferScreen> {
  List<String> profileButton=['Schedule','Bio','Reviews'];
  int _selectedIndex=0;
  _onSelected(int i){
    setState(() {
      _selectedIndex=i;
    });

  }
  Widget showSelected(){
    if(_selectedIndex==0){
return BookOfferScheduleScreen();

    }
    else  if(_selectedIndex==1){
      return BookOffeBioScreen();

    }
    else  if(_selectedIndex==2){
      return BookOfferReviewScreen();
    }
  }

  int maxLines = 2;
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    return BookOfferScreen();
  }

Widget BookOfferScreen() {

  switch (MediaQuery
      .of(context)
      .orientation) {
    case Orientation.landscape:
      double width=MediaQuery.of(context).size.height;
      double height=MediaQuery.of(context).size.width;
      return Scaffold(
        backgroundColor: themeColor2,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBarHome(size: height,title: "My Offers", showHome: false,),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: height*0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height:height*0.02,),
                BookOfferContainer(
                    width:height, height: height * 0.15),
                SizedBox(height:height*0.02,),
                BookOfferFavouriteContainer(
                    cWidth:height,
                    cHeight: height),
                SizedBox(height:height*0.03,),
                VariableText(text: getTranslated(context, 'View Details'), fontsize: 20, fontcolor: Color(0xFF2C3E50),),
                SizedBox(height:height*0.01,),
                Container(
                  //height: height * 0.05,
                  width: height,
                  //color: Colors.yellow,
                  child: Wrap(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VariableText( max_lines: maxLines, line_spacing: 1.5, text: 'Pellentesque Tincidunt Tristique Neque, Eget Venenatis Pellentesque Tincidunt Pellentesque Tincidunt Tristique Neque, Eget Venenatis Tristique Neque, Eget Venenatis Pellentesque Pellentesque Tincidunt Tristique Neque, Eget Venenatis Tincidunt Tristique Neque, Eget Venenatis', fontsize: 12,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                      showMore != true ?
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            maxLines = 10;
                            showMore = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: VariableText(text: getTranslated(context, 'More'),underlined: true, fontsize: 13, fontcolor:themeColor1,),
                        ),
                      ): Container()
                    ],
                  ),
                ),
                SizedBox(height:height*0.03,),
                Container(
                  child: Row(
                    children: List.generate(profileButton.length, (index) =>
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _onSelected(index);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF8F7F7),
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  /* index == 0 ? BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)):
                              BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))*/
                                ),
                                child: Container(
                                  height: height*0.06,
                                  //width: height*0.315,
                                  decoration: BoxDecoration(
                                      color: _selectedIndex == index
                                          ? Color(0xFF00AEEF)
                                          : Color(0xFFF8F7F7),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: VariableText(
                                        text: getTranslated(context, profileButton[index]),
                                        fontsize: 15,
                                        fontcolor: _selectedIndex == index
                                            ? Colors.white
                                            : Color(0xFF2C3E50)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),),
                  ),
                ),
                showSelected(),




              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(

          child: Container(
            height: height * 0.10,

            color: themeColor2,

            child: GestureDetector(
                onTap: () {

                },
                child:   Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8,horizontal: 16),

                  child:
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            buttonHeight: height*0.07,

                            buttonBorderRadius:8,
                            buttonFontSize:height*0.025,
                            buttonColor:themeColor3,
                            buttonTextColor:themeColor2,
                            buttonText: getTranslated(context, "Get Offer"),
                            buttonFontFamily:'sfdm',
                            buttonOnTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>GetOfferPaymentScreen())); }
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
        ),
      );
    case Orientation.portrait:
      double height=MediaQuery.of(context).size.height;
      double width=MediaQuery.of(context).size.width;
      return Scaffold(
        backgroundColor: themeColor2,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBarHome(size: height,title: "My Offers", showHome: false,),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: height*0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height:height*0.02,),
                BookOfferContainer(
                    width:width, height: height * 0.15),
                SizedBox(height:height*0.02,),
                BookOfferFavouriteContainer(
                    cWidth:width,
                    cHeight: height),
                SizedBox(height:height*0.03,),
                VariableText(text: getTranslated(context, 'View Details'), fontsize: 20, fontcolor: Color(0xFF2C3E50),),
                SizedBox(height:height*0.01,),
                Container(
                  //height: height * 0.05,
                  width: width,
                  //color: Colors.yellow,
                  child: Wrap(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VariableText( max_lines: maxLines, line_spacing: 1.5, text: 'Pellentesque Tincidunt Tristique Neque, Eget Venenatis Pellentesque Tincidunt Pellentesque Tincidunt Tristique Neque, Eget Venenatis Tristique Neque, Eget Venenatis Pellentesque Pellentesque Tincidunt Tristique Neque, Eget Venenatis Tincidunt Tristique Neque, Eget Venenatis', fontsize: 12,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                      showMore != true ?
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            maxLines = 10;
                            showMore = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: VariableText(text: getTranslated(context, 'More'),underlined: true, fontsize: 13, fontcolor:themeColor1,),
                        ),
                      ): Container()
                    ],
                  ),
                ),

                SizedBox(height:height*0.03,),
                Container(
                  child: Row(
                    children: List.generate(profileButton.length, (index) =>
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _onSelected(index);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF8F7F7),
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  /* index == 0 ? BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)):
                              BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))*/
                                ),
                                child: Container(
                                  height: height*0.06,
                                  //width: width*0.295,
                                  decoration: BoxDecoration(
                                      color: _selectedIndex == index
                                          ? Color(0xFF00AEEF)
                                          : Color(0xFFF8F7F7),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: VariableText(
                                        text: getTranslated(context, profileButton[index]),
                                        fontsize: 15,
                                        fontcolor: _selectedIndex == index
                                            ? Colors.white
                                            : Color(0xFF2C3E50)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),),
                  ),
                ),
                showSelected(),




              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(

          child: Container(
            height: height * 0.10,

            color: themeColor2,

            child: GestureDetector(
              onTap: () {

              },
              child:   Padding(
                padding:  EdgeInsets.symmetric(vertical: 8,horizontal: 16),

                child:
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                          buttonHeight: height*0.07,

                          buttonBorderRadius:8,
                          buttonFontSize:height*0.025,
                          buttonColor:themeColor3,
                          buttonTextColor:themeColor2,
                          buttonText: getTranslated(context, "Get Offer"),
                          buttonFontFamily:'sfdm',
                          buttonOnTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>GetOfferPaymentScreen()));  }
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
        ),
      );
  }
}
}
